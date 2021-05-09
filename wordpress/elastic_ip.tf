resource "aws_eip" "web" {
    instance = aws_launch_template.ec2_launch.id
    vpc      = true
}