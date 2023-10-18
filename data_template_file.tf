data "template_file" "template_file" {
  for_each = local.template_files

  template = file("${path.module}/templates/${each.value.template_file}")
  vars = {
    fgt_name              = each.value.fgt_name
    admin_port            = var.admin_port
    fgt_password          = var.fgt_password
  }
}