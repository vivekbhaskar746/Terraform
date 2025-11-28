provider "aws"{
    region=var.region
    profile="default"
}


resource "aws_vpc" "main"{
    count= var.create_vpc==true? 1: 0
    cidr_block= var.vpc_cidrblock
    tags={
        name="project-vpc-01"
    }
}

resource "aws_subnet" "main_subnet"{
    count=var.create_vpc==true?3 :0
    vpc_id= aws_vpc.main[0].id
    cidr_block=cidrsubnet(var.vpc_cidrblock,8,count.index)
    tags={
        name="privatesubnet{count.index}"
    }
}


resource "aws_instance" "my_instance"{
    ami=var.ami
    instance_type="m5.large"
    subnet_id=aws_subnet.main_subnet[0].id
}