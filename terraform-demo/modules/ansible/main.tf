resource "null_resource" "run_ansible_modify_hosts_file" {
  triggers = {
    var_instance_ip = var.instance_public_ip
  }

  provisioner "local-exec" {
    command = "sudo ansible-playbook ${var.ansible_script_path}/modify_hosts_file.yml --extra-vars  \"instance_public_ip=${var.instance_public_ip} ssh_user=${var.ssh_user} inventory_file=hosts.ini\""
  }
}


resource "null_resource" "cleanup_ssh_known_hosts" {
  depends_on = [null_resource.run_ansible_modify_hosts_file]

  provisioner "local-exec" {
    command = "ssh-keygen -R ${google_compute_instance.linux_vm.network_interface[0].access_config[0].nat_ip}"
  }
}

resource "null_resource" "cleanup_root_ssh_known_hosts" {
  depends_on = [null_resource.run_ansible_modify_hosts_file]

  provisioner "local-exec" {
    command = "ssh-keygen -f '/root/.ssh/known_hosts' -R ${google_compute_instance.linux_vm.network_interface[0].access_config[0].nat_ip}"
  }
}

resource "time_sleep" "wait_for_10_seconds" {
  depends_on = [null_resource.run_ansible_modify_hosts_file]

  create_duration = "59s"  # Wait for 10 seconds
}

resource "null_resource" "run_ansible_create_file" {
  depends_on = [time_sleep.wait_for_10_seconds]

  triggers = {
    var_instance_ip = var.instance_public_ip
  }

  provisioner "local-exec" {
    command = "sudo ansible-playbook -i ${var.ansible_script_path}/hosts.ini ${var.ansible_script_path}/create_file.yml"
  }
}