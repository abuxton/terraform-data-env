# ------------------------------------------------------------------------------
# Resources
# ------------------------------------------------------------------------------

resource "commandpersistence_cmd" "which_python" {
  program = ["shell", "which python"]
  path    = "/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin"

}
resource "commandpersistence_cmd" "which_jq" {
  program = ["which", "jq"]

}
resource "commandpersistence_cmd" "terraform_module_versions" {
  program = ["jq", "\".Modules\" .terraform/modules/modules.json"]

}

