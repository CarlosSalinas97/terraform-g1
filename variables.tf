variable "region" {
  description = "Region permitida en AWS"
}

variable "instance_type" {
  description = "Tipo de instancia utilizadas para laboratorio"
  type = string
}

variable "ami_id" {
  description = "ID de la AMI para la instancia EC2"
  type = string
}

variable "vpc1_id" {
  description = "ID de la VPC del laboratorio"
}

variable "internet_gateway_id" {
  description = "ID del IGW del laboratorio"
}

variable "key1" {
  description = "nombre de la clave pública registrada en amazon para el acceso a la instancia"
  type = string
}

//De acá para abajo no se si hay que borrarlas o dejarlas. En el readme no figuran
variable "vpc_cidr" {
  description = "VPC Main 1 CIDR"
}

variable "subnet1_cidr" {
  description = "Subnet 1 CIDR"
}

variable "subnet1_zone_1a" {
  description = "Zone 1a - Subnet 1"
}

variable "subnet1_private_ip" {
  description = "Subnet 1 Private IP"
  type = string
}

variable "username" {
  description = "Resource Owner | AWS IAM username"
  type = string
}