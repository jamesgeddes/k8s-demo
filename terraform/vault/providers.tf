provider "aws" {
  region = var.region
}

provider "github" {
  version = "~> 5.0"
}

provider "hcp" {

}

provider "random" {
}
