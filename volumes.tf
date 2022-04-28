resource "harvester_volume" "ubuntu20-dev-mount-disk" {
  name      = "ubuntu20-dev-mount-disk"
  namespace = "default"

  size = "10Gi"
}

resource "harvester_volume" "ubuntu20-dev-image-disk" {
  name      = "ubuntu20-dev-image-disk"
  namespace = "default"

  size  = "10Gi"
  image = "harvester-public/ubuntu20"
}

resource "harvester_volume" "ubuntu20-dev-desk-mount-disk" {
  name      = "ubuntu20-dev-desk-mount-disk"
  namespace = "default"

  size = "100Gi"
}

resource "harvester_volume" "ubuntu20-dev-desk-image-disk" {
  name      = "ubuntu20-dev-desk-image-disk"
  namespace = "default"

  size  = "10Gi"
  image = "harvester-public/ubuntu20"
}