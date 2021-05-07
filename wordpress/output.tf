output "elastic_ip_web" {
    value = aws_eip.web.public_ip
}

output "wordpress-endpoint" {
    value = "http://${aws_instance.web1.public_dns}/wordpress/wp-admin/install.php"
}

output "db-address" {
    value = aws_db_instance.db1.address
}