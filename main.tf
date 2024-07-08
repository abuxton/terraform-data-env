# ------------------------------------------------------------------------------
# Resources
# ------------------------------------------------------------------------------


resource "terraform_data" "test" {
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
}


data "local_file" "modules_json" {
  filename = "${path.cwd}/.terraform/modules/modules.json"
}
