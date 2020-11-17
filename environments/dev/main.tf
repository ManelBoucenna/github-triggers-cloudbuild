locals {
  "env" = "dev"
}

provider "google" {
  project = "${var.project}"
}

module "vpc" {
  source  = "../../modules/vpc"
  project = "${var.project}"
  env     = "${local.env}"
}

module "vm" {
  source  = "../../modules/vm"
  project = "${var.project}"
  subnet  = "${module.vpc.subnet}"
}
