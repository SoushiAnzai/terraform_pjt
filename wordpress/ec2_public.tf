resource "aws_instance" "web1" {
    ami                         = var.ec2_ami_web_public
    instance_type               = var.ec2_instance_type_web
    key_name                    = var.aws_key_name  # EC2 に登録済の Key Pairs を指定する
    vpc_security_group_ids      = [aws_security_group.web_sg.id]
    subnet_id                   = aws_subnet.public_web_subnet1.id
    associate_public_ip_address = "true"
    root_block_device {
        volume_type = "gp2"
        volume_size = "20"
    }
    ebs_block_device {
        device_name = "/dev/sdf"
        volume_type = "gp2"
        volume_size = "100"
    }
    tags = {
        Name = "${var.pjt_name}-public-web1"
    }
}