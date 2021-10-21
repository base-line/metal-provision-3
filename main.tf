// ssh-key
module "key" {
  source     = "git::github.com/andrewpopa/terraform-metal-project-ssh-key"
  project_id = var.project_id
}

// request elastic ip
module "ip" {
  source = "git::git@github.com:andrewpopa/terraform-metal-reserved-ip-block.git"
  project_id  = var.project_id
  quantity    = var.quantity
  facility    = var.facility
  description = var.description
}

// configuring ElasticIP for the device
data "template_file" "this" {
  template = file("bootstrap/ip.sh")
  vars = {
    ip = module.ip.cidr_notation
    netmask = module.ip.netmask
  }
}

// create the device
module "device" {
  source = "git::github.com/andrewpopa/terraform-metal-device.git"
  hostname            = "tf-ubuntu-userdata"
  plan                = "t1.small.x86"
  facilities          = ["ams1"]
  operating_system    = "ubuntu_18_04"
  billing_cycle       = "hourly"
  project_id          = var.project_id
  project_ssh_key_ids = [module.key.id]
  user_data           = data.template_file.this.rendered
}

// attach the IP to the device
resource "metal_ip_attachment" "this" {
  device_id = module.device.id
  cidr_notation = join("/", [cidrhost(module.ip.cidr_notation, 0), "32"])
}