resource "aws_subnet" "public_web_1a" {
    vpc_id                  = "${aws_vpc.wp_vpc.id}"
    cidr_block              = var.subnet_cidr
    availability_zone       = "ap-northeast-1a"
    map_public_ip_on_launch = true
    tags {
        Name = "${var.pjt_name}-public-subnet1a"
    }
}