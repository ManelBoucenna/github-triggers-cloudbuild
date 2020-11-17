output "network" {
  value = "${module.vpc.network}"
}

output "subnet" {
  value = "${module.vpc.subnet}"
}

output "instance_name" {
  value = "${module.vm.instance_name}"
}

output "external_ip" {
  value = "${module.vm.external_ip}"
}