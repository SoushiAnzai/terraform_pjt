resource "aws_route_table" "public_rtb" {
    vpc_id = aws_vpc.wp_vpc.id
    route {
        cidr_block = var.rtb_public_cidr
        gateway_id = aws_internet_gateway.wp_igw.id
    }
    tags = {
        Name = "${var.pjt_name}-public-rtb"
    }
}

resource "aws_route_table_association" "public_rtb" {
    subnet_id      = aws_subnet.public_web_subnet1.id
    route_table_id = aws_route_table.public_rtb.id
}