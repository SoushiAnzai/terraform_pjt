# webサーバ用
resource "aws_security_group" "web_sg" {
    name        = "wp_web"
    description = "It is a security group on http of wp_vpc"
    vpc_id      = aws_vpc.wp_vpc.id
    tags = {
        Name = "${var.pjt_name}_web_sg"
    }
}

resource "aws_security_group_rule" "ssh" {
    type              = "ingress"
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.web_sg.id
}

resource "aws_security_group_rule" "web" {
    type              = "ingress"
    from_port         = 80
    to_port           = 80
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.web_sg.id
}

resource "aws_security_group_rule" "all" {
    type              = "egress"
    from_port         = 0
    to_port           = 65535
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.web_sg.id
}

# DBサーバ用
resource "aws_security_group" "db_sg" {
    name        = "db_server"
    description = "It is a security group on db of wp_vpc."
    vpc_id      = aws_vpc.wp_vpc.id
    tags = {
        Name = "${var.pjt_name}_db_sg"
    }
}

resource "aws_security_group_rule" "db" {
    type                     = "ingress"
    from_port                = 3306
    to_port                  = 3306
    protocol                 = "tcp"
    source_security_group_id = aws_security_group.web_sg.id
    security_group_id        = aws_security_group.db_sg.id
}