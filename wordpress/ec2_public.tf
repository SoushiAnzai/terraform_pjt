# resource "aws_instance" "web1" {
#     ami                         = var.ec2_ami_web_public
#     instance_type               = var.ec2_instance_type_web
#     key_name                    = var.aws_key_name  # EC2 に登録済の Key Pairs を指定する
#     vpc_security_group_ids      = [aws_security_group.web_sg.id]
#     subnet_id                   = aws_subnet.public_web_subnet1.id
#     associate_public_ip_address = "true"
#     root_block_device {
#         volume_type = "gp2"
#         volume_size = "20"
#     }
#     ebs_block_device {
#         device_name = "/dev/sdf"
#         volume_type = "gp2"
#         volume_size = "100"
#     }
#     tags = {
#         Name = "${var.pjt_name}-public-web1"
#     }
# }

####################
# EC2 Launch Template
####################
resource "aws_launch_template" "ec2_launch" {
    name          = "ec2_launch"
    image_id      = var.ec2_ami_web_public
    instance_type = var.ec2_instance_type_web

    key_name = var.aws_key_name

    vpc_security_group_ids = [
        aws_security_group.web_sg.id
    ]

    //EFS作成後にユーザデータを実行させるためtemplate_file使用
    user_data = base64encode(data.template_file.script.rendered)

    block_device_mappings {
        device_name = "/dev/xvda"

        ebs {
            volume_size           = "30"
            volume_type           = "gp2"
            delete_on_termination = "true"
        }
    }

    tag_specifications {
        resource_type = "instance"

        tags = {
            Name = "${var.pjt_name}-public-web"
        }
    }

    tags = {
        Name = "${var.pjt_name}-public-lt"
    }
}

####################
# User data用　Template File
####################
data "template_file" "script" {
    template = file("script.tpl")
    vars = {
        efs_id = aws_efs_file_system.wp_efs.id
    }
}