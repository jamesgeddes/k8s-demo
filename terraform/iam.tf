resource "aws_iam_policy" "alb_ingress_controller" {
  name        = "ALBIngressControllerIAMPolicy"
  description = "IAM policy for ALB Ingress Controller"

  policy = file("${path.module}/alb_ingress_policy.json")
  # Make sure to provide the correct path to your policy JSON file
}

resource "aws_iam_role" "alb_ingress_controller" {
  name               = "ALBIngressControllerIAMRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::<ACCOUNT_ID>:oidc-provider/oidc.eks.<REGION>.amazonaws.com/id/<EKS_CLUSTER_OIDC_ID>"]
    }

    condition {
      test     = "StringEquals"
      variable = "${aws_eks_cluster.your_cluster.identity.0.oidc.0.issuer}:sub"
      values   = ["system:serviceaccount:kube-system:aws-load-balancer-controller"]
      # This should match your service account name and namespace
    }
  }
}

resource "aws_iam_role_policy_attachment" "alb_ingress_controller_attach" {
  role       = aws_iam_role.alb_ingress_controller.name
  policy_arn = aws_iam_policy.alb_ingress_controller.arn
}
