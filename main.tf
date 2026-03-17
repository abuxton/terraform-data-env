# ------------------------------------------------------------------------------
# Resources
# ------------------------------------------------------------------------------


resource "terraform_data" "test" {
  count = var.enable_debug_provisioners ? 1 : 0
  # This resource exists purely for spelunking the TFC/E workspace
  provisioner "local-exec" {
    command = "ls -lia"
  }
  provisioner "local-exec" {
    command = "pwd"
  }
  provisioner "local-exec" {
    command = "cat ${path.cwd}/.terraform/modules/modules.json | jq . "
  }
  provisioner "local-exec" {
    command = "jq ' .Modules[] | { module: .Key, version: .Version  }'  .terraform/modules/modules.json "
  }
  
  # System Discovery (Docker/Container Context)
  provisioner "local-exec" {
    command = "echo '--- OS Release Info ---'; cat /etc/os-release || echo 'No /etc/os-release'"
  }
  provisioner "local-exec" {
    command = "echo '--- Kernel Info ---'; uname -a"
  }
  provisioner "local-exec" {
    command = "echo '--- User Info ---'; id; whoami"
  }
  provisioner "local-exec" {
    command = "echo '--- Disk Usage ---'; df -h"
  }
  provisioner "local-exec" {
    command = "echo '--- Memory Usage ---'; free -m || echo 'free command not found'"
  }
  provisioner "local-exec" {
    command = "echo '--- Network Interfaces ---'; ip addr || ifconfig || echo 'ip/ifconfig not found'"
  }
  provisioner "local-exec" {
    command = "echo '--- Installed Tools ---'; git --version; terraform --version; jq --version"
  }
  provisioner "local-exec" {
    command = "echo '--- Environment Variables (Raw) ---'; env | sort"
  }
}


data "local_file" "modules_json" {
  filename = "${path.cwd}/.terraform/modules/modules.json"
}
