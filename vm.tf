resource "harvester_virtualmachine" "ubuntu20-dev" {
  name      = "ubuntu-dev"
  namespace = "default"

  description = "Our Ubuntu Server"
  tags = {
    ssh-user = "ubuntu"
  }

  cpu    = 2
  memory = "2Gi"

  start        = true
  hostname     = "terry"
  machine_type = "q35"

  ssh_keys = [
    "mysshkey"
  ]

  network_interface {
    name         = "nic-1"
    network_name = harvester_network.vlan1.id
  }

  network_interface {
    name         = "nic-2"
    model        = "virtio"
    type         = "bridge"
    network_name = harvester_network.vlan2.id
  }

  network_interface {
    name         = "nic-3"
    model        = "e1000"
    type         = "bridge"
    network_name = harvester_network.vlan3.id
  }

  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = "10Gi"
    bus        = "virtio"
    boot_order = 1

    image       = harvester_image.ubuntu20.id
    auto_delete = true
  }

  disk {
    name        = "emptydisk"
    type        = "disk"
    size        = "20Gi"
    bus         = "virtio"
    auto_delete = true
  }

  disk {
    name = "mount-disk"
    type = "disk"
    bus  = "scsi"

    existing_volume_name = harvester_volume.ubuntu20-dev-mount-disk.name
    auto_delete          = false
    hot_plug             = true
  }

  cloudinit {
    user_data    = <<-EOF
      #cloud-config
      user: ubuntu
      password: root
      chpasswd:
        expire: false
      ssh_pwauth: true
      package_update: true
      packages:
        - qemu-guest-agent
      apt:
        proxy: http://proxy-wsa.esl.cisco.com:80/
        http_proxy: http://proxy-wsa.esl.cisco.com:80/
        https_proxy: http://proxy-wsa.esl.cisco.com:80/
      runcmd:
        - - systemctl
          - enable
          - '--now'
          - qemu-guest-agent
      ssh_authorized_keys:
        - >-
          your ssh public key
      EOF
    network_data = ""
  }
}

resource "harvester_virtualmachine" "ubuntu20-dev-desktop" {
  name      = "ubuntu-desktop"
  namespace = "default"

  description = "Our Ubuntu Desktop"
  tags = {
    ssh-user = "ubuntu"
  }

  cpu    = 2
  memory = "8Gi"

  start        = true
  hostname     = "harvey"
  machine_type = "q35"

  ssh_keys = [
    "mysshkey"
  ]

  network_interface {
    name         = "nic-1"
    network_name = harvester_network.vlan1.id
  }

  network_interface {
    name         = "nic-2"
    model        = "virtio"
    type         = "bridge"
    network_name = harvester_network.vlan2.id
  }

  network_interface {
    name         = "nic-3"
    model        = "e1000"
    type         = "bridge"
    network_name = harvester_network.vlan3.id
  }

  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = "10Gi"
    bus        = "virtio"
    boot_order = 1

    image       = harvester_image.ubuntu20.id
    auto_delete = true
  }

  disk {
    name        = "emptydisk"
    type        = "disk"
    size        = "20Gi"
    bus         = "virtio"
    auto_delete = true
  }

  disk {
    name = "mount-disk"
    type = "disk"
    bus  = "scsi"

    existing_volume_name = harvester_volume.ubuntu20-dev-desk-mount-disk.name
    auto_delete          = false
    hot_plug             = true
  }

  cloudinit {
    user_data    = <<-EOF
      #cloud-config
      user: ubuntu
      password: root
      chpasswd:
        expire: false
      ssh_pwauth: true
      package_update: true
      packages:
        - qemu-guest-agent
        - ubuntu-desktop
      apt:
        proxy: http://proxy-wsa.esl.cisco.com:80/
        http_proxy: http://proxy-wsa.esl.cisco.com:80/
        https_proxy: http://proxy-wsa.esl.cisco.com:80/
      runcmd:
        - - systemctl
          - enable
          - '--now'
          - qemu-guest-agent
      ssh_authorized_keys:
        - >-
          your ssh public key
      EOF
    network_data = ""
  }
}