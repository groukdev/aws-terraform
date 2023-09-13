variable "region" {
  default = "us-east-1"
}

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

variable "instance_name" {
  description = "Lista de nome das instancias"
  type        = list(string)
  default     = ["HelloWorld", "HelloWorld2", "HelloWorld3"]
}

variable "amis" {
  description = "Amis para determinadas regiões"
  type        = map(any)
  default = {
    "us-east-1" = "ami-05fa00d4c63e32376"
    "us-east-2" = "ami-0568773882d492fc8"
  }
}
