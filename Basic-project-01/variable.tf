variable "region" {
    type = string
    description="contains region where we will deploy the project"
}

variable "create_vpc"{
    type= bool
   
}

variable "vpc_cidrblock"{
    description="contain cidr range for ipv4"
    type= string
    default= "10.0.0.0/16"
}


variable "subnet_id"{
    type= string
    default= null
}

variable "ami"{
    type= string
}

