resource "aws_db_instance" "db1" {
    identifier              = "${var.pjt_name}-dbinstance1"
    allocated_storage       = 5
    engine                  = "mysql"
    engine_version          = "5.7"
    instance_class          = "db.t2.micro"
    storage_type            = "gp2"
    username                = var.wp_db_username
    password                = var.wp_db_password
    backup_retention_period = 1
    vpc_security_group_ids  = [aws_security_group.db_sg.id]
    db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
    skip_final_snapshot     = true # trueにしないとdestroyできない
    # インスタンス削除時にスナップショットをとる（skip_final_snapshot = false）ならば、合わせてfinal_snapshot_identifierの設定が必要
}