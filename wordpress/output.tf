//Webアクセス用にコンソール表示
output "elb_dns_name" {
    value = aws_lb.wp_elb.dns_name
}

//WordPress設定用にコンソール表示
output "rds_endpoint" {
	value = aws_db_instance.db1.endpoint
}