# Key pair for the instances



resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags {
        Name = "${var.vpc_name}"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "${var.vpc_name}"
    }
}

resource "aws_route_table" "r" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    depends_on = ["aws_internet_gateway.gw"]

    tags {
        Name = "${var.vpc_name}"
    }
}

resource "aws_route_table_association" "publicA" {
    subnet_id = "${aws_subnet.publicA.id}"
    route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "publicB" {
    subnet_id = "${aws_subnet.publicB.id}"
    route_table_id = "${aws_route_table.r.id}"
}

# resource "aws_route_table_association" "publicC" {
#     subnet_id = "${aws_subnet.publicC.id}"
#     route_table_id = "${aws_route_table.r.id}"
# }

resource "aws_subnet" "publicA" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.100.0/24"
    availability_zone = "${var.region}a"
    map_public_ip_on_launch = true

    tags {
        Name = "${var.vpc_name}-PubSubnetA"
    }
}

resource "aws_subnet" "publicB" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.101.0/24"
    availability_zone = "${var.region}b"
    map_public_ip_on_launch = true

    tags {
        Name = "${var.vpc_name}-PubSubnetB"
    }
}

# resource "aws_subnet" "publicC" {
#     vpc_id = "${aws_vpc.main.id}"
#     cidr_block = "10.0.102.0/24"
#     availability_zone = "${var.region}c"
#     map_public_ip_on_launch = true

#     tags {
#         Name = "${var.vpc_name}-PubSubnetC"
#     }
# }

resource "aws_security_group" "rancher-tf" {
  name = "rancher-tf"
  description = "Allow inbound ssh traffic"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = 8
    to_port = 0
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 500
    to_port     = 500
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 4500
    to_port     = 4500
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
      from_port = 6443
      to_port = 6443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 8000
      to_port = 10000
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 30000
      to_port = 32767
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["10.0.0.0/16"]
  }


  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "rancher-cluster"
  }
}

