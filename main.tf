# Provider details to connect  to GCP
provider "google" {
  version = "3.5.0"

  credentials = file(var.credentials_file_path)

  project = "acn-bestbuy"
  region  = "us-central1"
  zone    = "us-central1-c"
}

locals {
  subnet_01    = "${var.network_name}-subnet-01"
  subnet_02    = "${var.network_name}-subnet-02"
}

module "test-vpc-module" {
  source = "../../../modules/network/vpc"
  project_id   = var.project_id
  network_name = "test-network"
  routing_mode = "REGIONAL"

 subnets = [
    {
      subnet_name   = "${local.subnet_01}"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-central1"
    },
    {
      subnet_name           = "${local.subnet_02}"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    },
  ]
  
}