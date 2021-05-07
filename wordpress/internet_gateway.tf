resource "aws_internet_gateway" "wp-igw" {
    vpc_id = aws_vpc.wp_vpc.id
    tags = {
        Name = "${var.pjt_name}-igw"
    }
}