terraform {
  required_version = "~> 1"

  required_providers {
    oci = {
      source = "hashicorp/oci"
      version = "~> 4"
    }
  }
  
}

locals {
  vcn_id = var.vcn_id
  cidr = var.cidr
  name = var.name
  
  vcn = data.oci_core_vcn.this
  subnet = module.subnet.subnet
  // routing_table = oci_core_route_table.this
}

data "oci_core_vcn" "this" {
  vcn_id = local.vcn_id
}

module "subnet" {
  source  = "Terraform-Modules-Lib/subnet/oci"
  
  vcn_id = local.vcn.id
  name = local.name
  cidr = local.cidr
  public = true
}

