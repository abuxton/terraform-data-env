module "helloworld" {
  count   = var.demo_module_bool ? 1 : 0
  source  = "briancain/helloworld/aws"
  version = "2020.4.21"
  # insert the 1 required variable here
  password = ""
}