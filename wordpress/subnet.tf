resource "aws_subnet" "public_web_subnet1" {
    vpc_id                  = aws_vpc.wp_vpc.id
    cidr_block              = var.subnet_cidr_public01
    availability_zone       = "ap-northeast-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.pjt_name}-public-subnet01"
    }
}

resource "aws_subnet" "private_db_subnet1" {
    vpc_id            = aws_vpc.wp_vpc.id
    cidr_block        = var.subnet_cidr_private01
    availability_zone = "ap-northeast-1a"
    tags = {
        Name = "${var.pjt_name}-private-subnet01"
    }
}

resource "aws_subnet" "private_db_subnet2" {
    vpc_id            = aws_vpc.wp_vpc.id    
    cidr_block        = var.subnet_cidr_private02
    availability_zone = "ap-northeast-1c"
    tags = {
        Name = "${var.pjt_name}-private-subnet02"
    }
}

# DB接続用subnetグループ
resource "aws_db_subnet_group" "db_subnet_group" {
    name        = "db_subnet_groupe"
    description = "It is a DB subnet group on wp_vpc."
    subnet_ids  = [aws_subnet.private_db_subnet1.id, aws_subnet.private_db_subnet2.id]
    tags = {
        Name = "${var.pjt_name}-db-subnet-group"
    }
}