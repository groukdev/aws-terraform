variable "int_type" {
  description = "Tipo de instancia EC2 WEB"
  type        = string
  default     = "t3.micro"
}

variable "disable_api_termination" {
  description = "Proteger a instancia contra delete acidental"
  type        = bool
  default     = true
}
