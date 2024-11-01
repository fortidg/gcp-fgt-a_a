variable "project" {}
variable "region" {}
variable "zone" {}
variable "zone2" {}

variable "prefix" {}

# FortiGates
variable "fortigate_machine_type" {}
variable "fortigate_vm_image" {}

variable "fgt_username" {
  type        = string
  default     = ""
  description = "FortiGate Username"
}
variable "fgt_password" {
  type        = string
  default     = ""
  description = "FortiGate Password"
}
variable "admin_port" {}

# debug
variable "enable_output" {
  type        = bool
  default     = true
  description = "Debug"
}

variable "healthcheck_port" {
  type        = number
  default     = 8008
  description = "Port used for LB health checks"
}

variable "fgt1_license_token" {
  type        = string
  default     = "null"
  description = "FortiFlex Token"
}

variable "fgt2_license_token" {
  type        = string
  default     = "null"
  description = "FortiFlex Token"
}

variable "fgt1_license_file" {
  type        = string
  default     = "null"
  description = "License file in local folder"

}

variable "fgt2_license_file" {
  type        = string
  default     = "null"
  description = "license file in local folder"

}

variable "license_type" {
  type = string
  default = "flex"
  description = "can be byol, flex, or payg, make sure the license is correct for the sku"
}