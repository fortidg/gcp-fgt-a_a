locals {
  rendered_templates = {
    for key, value in local.template_files : key => templatefile("${path.module}/templates/${value.template_file}", {
      fgt_name         = value.fgt_name
      admin_port       = var.admin_port
      fgt_password     = var.fgt_password
      healthcheck_port = var.healthcheck_port
      license_type     = value.license_type
      license_file     = value.license_file
      license_token    = value.license_token
      port1-ip         = value.port1-ip
      port2-ip         = value.port2-ip
      elb_ip           = value.elb_ip
      ilb_ip           = value.ilb_ip
      ext_gw           = value.ext_gw
      int_gw           = value.int_gw
      fgsp             = value.fgsp
      ha_index         = value.ha_index
      peerip           = value.peerip
    })
  }
}