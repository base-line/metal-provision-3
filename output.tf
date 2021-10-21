output "access_public_ipv4" {
  description = "public ipv4"
  value       = module.device.access_public_ipv4
}

output "elastic_ip" {
  description = "elastic ip"
  value       = join("/", [cidrhost(module.ip.cidr_notation, 0), "32"])
}

output "connection" {
  value = "ssh root@${module.device.access_public_ipv4} -i ${module.key.private_key_filename}.pem"
}