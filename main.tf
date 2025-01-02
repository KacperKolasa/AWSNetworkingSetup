provider "aws" {
    region = "eu-west-2"
}

module "vpc" {
    source = "./vpc"
    cidr_block = "10.0.0.0/20"
    tags = {
        Name = "main-vpc"
    }
}

module "public-subnet01" {
    source = "./subnet"
    vpc_id = module.vpc.vpc_id
    cidr_block = "10.0.0.0/24"
    availability_zone = "eu-west-2a"
    tags = {
      Name = "public-subnet01"
    }
}

module "public-subnet02" {
    source = "./subnet"
    vpc_id = module.vpc.vpc_id
    cidr_block = "10.0.1.0/24"
    availability_zone = "eu-west-2b"
    tags = {
      Name = "public-subnet02"
    }
}

module "private-subnet01" {
    source = "./subnet"
    vpc_id = module.vpc.vpc_id
    cidr_block = "10.0.2.0/24"
    availability_zone = "eu-west-2a"
    tags = {
      Name = "private-subnet01"
    }
}

module "private-subnet02" {
    source = "./subnet"
    vpc_id = module.vpc.vpc_id
    cidr_block = "10.0.3.0/24"
    availability_zone = "eu-west-2b"
    tags = {
      Name = "private-subnet02"
    }
}

module "igw" {
    source = "./igw"
    vpc_id = module.vpc.vpc_id
    tags = {
      Name = "main-igw"
    }
}

module "nat01" {
    source = "./nat"
    domain = "vpc"
    eiptags = {
        Name = "eip01"
    }
    allocation_id = module.nat01.eip_id
    subnet_id = module.public-subnet01.subnet_id
    connectivity_type = "public"
    nattags = {
      Name = "nat01"
    }
}

module "nat02" {
    source = "./nat"
    domain = "vpc"
    eiptags = {
        Name = "eip02"
    }
    allocation_id = module.nat02.eip_id
    subnet_id = module.public-subnet02.subnet_id
    connectivity_type = "public"
    nattags = {
      Name = "nat02"
    }
}

module "public-rtb" {
  source = "./rtb"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "public-rtb"
  }
  subnet_ids = {
    subnet01 = module.public-subnet01.subnet_id,
    subnet02 = module.public-subnet02.subnet_id
  }
  routes = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.igw.igw_id
    }
  ]
}

module "private-rtb01" {
  source = "./rtb"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "private-rtb01"
  }
  subnet_ids = {
    subnet01 = module.private-subnet01.subnet_id
  }
  routes = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.nat01.nat_id
    }
  ]
}

module "private-rtb02" {
  source = "./rtb"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "private-rtb02"
  }
  subnet_ids = {
    subnet01 = module.private-subnet02.subnet_id
  }
  routes = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.nat02.nat_id
    }
  ]
}