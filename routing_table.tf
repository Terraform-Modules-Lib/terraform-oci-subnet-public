resource "oci_core_route_table" "routing_table" {
  compartment_id = local.vcn.compartment_id
  vcn_id = local.vcn.id

  display_name = local.name
  
  route_rules = [
    {
      network_entity_id = oci_core_internet_gateway.internet.id

      description = format("Internet route for %s subnet", local.name)
      destination_type = "CIDR_BLOCK"
      destination = "0.0.0.0/0"
    }
  ]
}


resource "oci_core_internet_gateway" "internet" {
  compartment_id = local.vcn.compartment_id
  vcn_id = local.vcn.id
  
  display_name = local.name
}
