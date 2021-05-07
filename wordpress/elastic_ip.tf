resource "aws_eip" "web" {
    instance = aws_instance.web1.id
    vpc      = true
}