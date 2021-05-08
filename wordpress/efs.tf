####################
# EFS
####################
resource "aws_efs_file_system" "wp_efs" {
    tags = {
        Name = "${var.pjt_name}-efs"
    }
}

####################
# EFS Mount Target 1a
####################
resource "aws_efs_mount_target" "efs_1a" {
    file_system_id  = aws_efs_file_system.wp_efs.id
    subnet_id       = aws_subnet.public_web_subnet1.id
    security_groups = [aws_security_group.efs.id]
}

####################
# EFS Mount Target 1c
####################
resource "aws_efs_mount_target" "efs_1c" {
    file_system_id  = aws_efs_file_system.wp_efs.id
    subnet_id       = aws_subnet.public_web_subnet2.id
    security_groups = [aws_security_group.efs_sg.id]
}
