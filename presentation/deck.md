---
marp: true
theme: uncover
class: inverted
---

k8s-demo
===

![h:250](https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Kubernetes_logo_without_workmark.svg/247px-Kubernetes_logo_without_workmark.svg.png)

##### A Kubernetes, CI & CD Demonstration

###### by James Geddes

---

# Features

- :computer: **Everything As Code**
- :whale: DockerHub repos _as code_
- :earth_africa: Terraform in logical modules
- :question: TDD FTW!
- :love_letter: Continuous Delivery with ArgoCD
- :eyeglasses: Metrics with Grafana
- and more...

even this presentation is defined in code!

---

# What does it do?

* Deploys prerequisite infra
    * DockerHub repo
    * Grafana
    * HCP Vault
    * S3 storage
    * Networking
    * IAM Policies
* Builds, tests & publishes containers to DockerHub
* Deploys cluster & ArgoCD, which pulls in services

---

# Tools

* Terraform
    - Market leader
    - declarative
    - many providers
* AWS Managed Grafana
    - Scales silently
* ArgoCD
    - GitOps
    - Automated

---

# Does it work?

Mostly!

Working on:

- finish configuring ArgoCD
- debug networking

---

# MVP vs Production

* MVP
    * Cloudinit to load a container into an EC2 instance.
    * Difficult to maintain.
    * Difficult to scale.
* Production-ready
    * automates almost all elements of getting services up and running.
    * extensible as services are simply added to the "services" directory.
    * maintainable due to logical separation.

---

## Ideal world

- separate CI & CD
- use a GA password store
- multirepo

... and don't destroy prod every night!