resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-example"
    labels = {
      App = "NginxDeploymentExample"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "NginxDeploymentExample"
      }
    }
    template {
      metadata {
        labels = {
          App = "NginxDeploymentExample"
        }
      }
      spec {
        container {
          image = "nginx:1.23.3"
          name  = "example"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
