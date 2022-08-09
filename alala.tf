locals {
  alala_type   = "g6-standard-2"
  alala_domain = linode_domain.smitelli-com
  alala_swap   = 512  # MiB

  alala_ips = {
    v4 = linode_instance.alala.ip_address
    v6 = cidrhost(linode_instance.alala.ipv6, 0)
  }
}

data "linode_instance_type" "alala" {
  id = local.alala_type
}

resource "linode_instance" "alala" {
  label            = "alala"
  region           = "us-southeast"
  type             = local.alala_type
  private_ip       = false
  resize_disk      = false
  backups_enabled  = true
  watchdog_enabled = true
  group            = local.alala_domain.domain
  tags             = [local.alala_domain.domain]

  disk {
    label      = "alala-root"
    size       = data.linode_instance_type.alala.disk - local.alala_swap
    filesystem = "ext4"
  }

  disk {
    label      = "alala-swap"
    size       = local.alala_swap
    filesystem = "swap"
  }

  config {
    label     = "alala-config"
    comments  = ""
    virt_mode = "paravirt"
    kernel    = "linode/grub2"
    run_level = "default"

    devices {
      sda { # default root device
        disk_label = "alala-root"
      }

      sdb {
        disk_label = "alala-swap"
      }
    }

    interface {
      purpose = "public"
    }

    helpers {
      distro             = true
      updatedb_disabled  = true
      modules_dep        = true
      devtmpfs_automount = true
      network            = true
    }
  }

  alerts {
    cpu            = 90    # Average % / 2 hours
    io             = 10000 # Average IOPS / 2 hours
    network_in     = 10    # Average Mbit/s / 2 hours
    network_out    = 10    # Average Mbit/s / 2 hours
    transfer_quota = 80    # %
  }
}

# NOTE: There is also an nftables firewall running here -- keep them in sync!
resource "linode_firewall" "alala" {
  label           = "alala-firewall"
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"
  linodes         = [linode_instance.alala.id]
  tags            = [local.alala_domain.domain]

  inbound {
    label    = "accept-icmp"
    action   = "ACCEPT"
    protocol = "ICMP"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "accept-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "accept-http"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "accept-https"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }
}

resource "linode_domain_record" "a_alala" {
  domain_id   = local.alala_domain.id
  record_type = "A"
  name        = "alala"
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_alala" {
  domain_id   = local.alala_domain.id
  record_type = "AAAA"
  name        = "alala"
  target      = local.alala_ips.v6
}

resource "linode_domain_record" "txt_spf_alala" {
  domain_id   = local.alala_domain.id
  record_type = "TXT"
  name        = "alala"
  target      = "v=spf1 include:${local.alala_domain.domain} a ~all"
}

resource "linode_rdns" "ptr_v4_alala" {
  address = local.alala_ips.v4
  rdns    = "${linode_domain_record.a_alala.name}.${local.alala_domain.domain}"
}

resource "linode_rdns" "ptr_v6_alala" {
  address = local.alala_ips.v6
  rdns    = "${linode_domain_record.aaaa_alala.name}.${local.alala_domain.domain}"
}
