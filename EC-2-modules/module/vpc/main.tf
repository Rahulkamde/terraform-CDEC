resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags       = merge(var.tags, tomap({ "Name" = format("%s-%s-my-vpc", var.ns, var.env), "Environment" = var.env }))
  }

  #Name = "My-VPC-${var.env}" 


resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnet_cidrs)
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  availability_zone       = element(var.azs, count.index)
  tags                    = merge(var.tags, tomap({ "Name" = format("%s-%s-public", var.ns, var.env), "Type" = "public", "Environment" = var.env }))
} 
  #Name = "Public Subnet-${var.env}-${count.index + 1}"


resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags              = merge(var.tags, tomap({ "Name" = format("%s-%s-private-subnet", var.ns, var.env), "Type" = "private", "Environment" = var.env }))
  #Name = "Private Subnet-${var.env}-${count.index + 1}" 
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name = format("%s-%s-igw", var.ns, var.env) })
  #Name = "MY-VPC IG-${var.env}"

}


resource "aws_eip" "nat_eip" {
  vpc  = true
  tags = merge(var.tags, { Name = format("%s-%s-nat-eip", var.ns, var.env) })
}



resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.private_subnet.*.id, 0)
  tags          = merge(var.tags, { Name = format("%s-%s-nat-gateway", var.ns, var.env) })
  #Name = "MY-Nat Gateway-${var.env}"
}



resource "aws_route_table" "first_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(var.tags, { Name = format("%s-%s-first-rt", var.ns, var.env) })
  #Name = "1st Route Table-${var.env}"
}



resource "aws_route_table" "second_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = merge(var.tags, { Name = format("%s-%s-second-rt", var.ns, var.env) })
  #Name = "2nd Route Table-${var.env}"

}



resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
  route_table_id = aws_route_table.first_rt.id
}


resource "aws_route_table_association" "private_subnet_asso" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(aws_subnet.private_subnet[*].id, count.index)
  route_table_id = aws_route_table.second_rt.id
}
