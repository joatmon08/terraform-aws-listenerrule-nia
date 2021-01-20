terraform {
  backend "remote" {
    organization = "hashicorp-team-da-beta"
    workspaces {
      name = "rosemary-terraform-aws-listener-rule-unit-tests"
    }
  }
}