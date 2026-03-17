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
    command = "if command -v jq >/dev/null 2>&1; then if [ -f \"${path.cwd}/.terraform/modules/modules.json\" ]; then cat \"${path.cwd}/.terraform/modules/modules.json\" | jq .; else echo 'modules.json not found at ${path.cwd}/.terraform/modules/modules.json'; fi; else echo 'jq not found; skipping modules.json pretty-print'; fi"
  }
  provisioner "local-exec" {
    command = "if command -v jq >/dev/null 2>&1; then if [ -f \"${path.cwd}/.terraform/modules/modules.json\" ]; then jq ' .Modules[] | { module: .Key, version: .Version  }' \"${path.cwd}/.terraform/modules/modules.json\"; else echo 'modules.json not found at ${path.cwd}/.terraform/modules/modules.json'; fi; else echo 'jq not found; skipping modules.json module listing'; fi"
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
    command = "echo '--- Installed Tools ---'; git --version; terraform --version; if command -v jq >/dev/null 2>&1; then jq --version; else echo 'jq not found'; fi"
  }
  provisioner "local-exec" {
    command = "echo '--- Environment Variables (Raw) ---'; env | sort"
  }
}


data "local_file" "modules_json" {
  filename = "${path.cwd}/.terraform/modules/modules.json"
}
