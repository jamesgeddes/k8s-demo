# Potential Improvements
To use this in a production environment, the following suggestions ("information, not advice") 
should be considered, as they are out of scope for this demonstration. This is not an exhaustive 
list as your specific situation and requirements are unique to you, but should give you a good 
starting point of factors to think about.

## Separate AWS accounts

The use of a separate AWS accounts ensures that,
- billing can be allocated easily.
- permissions can be managed on a more granular basis.
- everything in the production account is seen as sacrosanct. 

## Remote State
Here, for the sake of simplicity, Terraform state is managed locally. This is not scalable and 
removes many of the benefits that Terraform can provide. Remote state ensures that everyone 
on the team can access the state appropriately. 

## Secrets manager
Please don't use post-it notes for your passwords; your software cannot see them, but 
your waste collector can!

Using a secrets manager gives you a central place to store both sensitive data and parameters 
that are not necessarily so secret but still need to be shared across elements of the estate. This 
approach means that you have one place to store all parameters, regardless of their sensitivity 
level, which helps to mitigate the risk of human error. The downside is that this may be more 
expensive than having separate secret and parameter stores.

Here, we have just gone with HCP Vault Secrets, however, in a production environment you may want to select a
product that is not in beta.

## Short-lived secrets
Long-lived secrets, ones that are valid for months, years or just forever, are often a security 
risk as they are still useful when they are inevitably leaked. Using short-lived secrets, ones 
that are valid for minutes or seconds, pose less of a security risk, as by the time they fall 
into the wrong hands, they are probably already invalid.

## Obey the Testing Goat
Use [Conftest](https://www.conftest.dev/)!

Treat your IaC with the same [TDD](https://www.obeythetestinggoat.com/) discipline that you use for
everything else. It takes more time in the short term, but saves time in the long run, leading to 
a better product overall.

## Do CI
Lock down a Continuous Integration process that includes all your automated testing.
Don't test and build manually. You have better things to do with your life.

## Do CD
Lock down a Continuous Delivery - or, ideally, a Continuous Deployment - process<br />
The [GitOps](https://www.gitops.tech/) flow using
[Argo CD](https://argo-cd.readthedocs.io/en/stable/) is a good option to explore if you intend 
to be entirely K8s driven.

## Separate CI and CD
Keep CI and CD separate. Using the same tool for CI and CD can cause difficulties.
Read the [CI](https://amzn.to/3ZB1u6V) and [CD](https://amzn.to/3kflHyU) books. Here, we have used GitHub actions for
simplicity, however,
ideally one would use different tools.

## Break down jobs

On the note of separating CI & CD, here, all of the things are in the one workflow to ensure that everything is set
up automatically. In a production environment, this might not be as important, since the first run only happens once.
As such, you may wish to separate the infra and the code workflows.

## YAML Injection

Here, some YAML files use value injection to ensure portability. In a production environment, this may not be as
important as transparency, security and complexity. Hard coding values _is_ sometimes OK.

## Multirepo?

For the sake of simplicity, everything is in one repo. In a production environment, you should decide whether the
monorepo or multirepo model is best for you. For example, [Uber tried both](https://youtu.be/lV8-1S28ycM).

## Linting

Code linting has not been included thus far as, while it adds readability, it does not add functionality. In a
production environment, all code should be linted during CI from the outset.

## Don't install every time

On the note of CI, the GitHub Actions workflows currently install tools every time.
This is inefficient and, particularly in a production environment, this can get expensive.
Ideally one would build images that contain all the required tools.

## Workspaces
Use Terraform workspace best practices.
[RTFM](https://developer.hashicorp.com/terraform/cloud-docs/recommended-practices/part1).

## Expose yourself
Use [Kubernetes services](https://kubernetes.io/docs/concepts/services-networking/service) to 
expose the application to the outside world. Code is only useful in the hands of the customer. 
Exposing the application was beyond the scope of this demonstration.

## Logical separation
Separate infrastructure configuration from application configuration. In this demonstration, 
just for simplicity, we deployed EKS into AWS, _and_ Nginx into that EKS instance, all within 
the same configuration structure. _Do not do this_. As soon as you want to deploy the next 
application to the cluster, your code will become 
_[challenging](https://en.wikipedia.org/wiki/English_understatement)_ to read, increasing the risk
of mistakes and hampering scalability.

In the real world, you should have one box (repo or directory) for all of the things relating to the
cluster and a *different* for each application, containing code, configuration, pipelines, 
documentation etc. You may need further separation depending on your specific estate requirements.

## Never Git your Secrets

No secrets were harmed in the making of this demo, however it bears repeating. Your repo is not 
a secrets manager, so do not hard code passwords, keys and other secrets into your code.

## JFDI

Ultimately, make it work, _then_ make it work well, _then_ make it pretty. Progress > perfection.

<br /><br /><br />

But trust me, on the [sunscreen](https://youtu.be/sTJ7AzBIJoI).
