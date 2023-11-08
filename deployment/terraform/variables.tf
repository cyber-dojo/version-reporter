variable "service_name" {
  type    = string
  default = "version-reporter"
}

variable "env" {
  type = string
}

variable "app_port" {
  type    = number
  default = 4528
}

variable "cpu_limit" {
  type    = number
  default = 20
}

variable "mem_limit" {
  type    = number
  default = 64
}

variable "mem_reservation" {
  type    = number
  default = 32
}

variable "TAGGED_IMAGE" {
  type = string
}

# App variables
variable "app_env_vars" {
  type = map(any)
  default = {
    CYBER_DOJO_PROMETHEUS            = "true"
    CYBER_DOJO_VERSION_REPORTER_PORT = "4528"
  }
}

variable "ecr_replication_targets" {
  type    = list(map(string))
  default = []
}

variable "ecr_replication_origin" {
  type    = string
  default = ""
}
