resource "harvester_network" "vlan1" {
  name      = "vlan1"
  namespace = "harvester-public"

  vlan_id = 11
}

resource "harvester_network" "vlan2" {
  name      = "vlan2"
  namespace = "harvester-public"

  vlan_id = 12
}

resource "harvester_network" "vlan3" {
  name      = "vlan3"
  namespace = "harvester-public"

  vlan_id = 13
}