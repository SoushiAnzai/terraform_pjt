resource "aws_subnet" "public_web_subnet1" {
    vpc_id                  = "${aws_vpc.wp_vpc.id}"
    cidr_block              = var.subnet_cidr
    availability_zone       = "ap-northeast-1a"
    map_public_ip_on_launch = true
    tags {
        Name = "${var.pjt_name}-public-subnet01"
    }
}

resource "aws_subnet" "private_db_subnet1" {
    vpc_id            = "${aws_vpc.tf_vpc.id}"
    cidr_block        = var.subnet_cidr
    availability_zone = "ap-northeast-1a"
    tags {
        Name = "${var.pjt_name}-private-subnet01"
    }
}

resource "aws_subnet" "private_db_subnet2" {
    vpc_id            = "${aws_vpc.tf_vpc.id}"
    cidr_block        = var.subnet_cidr
    availability_zone = "ap-northeast-1c"
    tags {
        Name = "${var.pjt_name}-private-subnet02"
    }
}