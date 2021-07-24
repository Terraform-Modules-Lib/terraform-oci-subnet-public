resource "oci_core_internet_gateway" "internet" {
  compartment_id = local.vcn.compartment_id
  vcn_id = local.vcn.id
  
  display_name = local.name
}
