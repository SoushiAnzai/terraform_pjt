# resource "aws_db_instance" "db1" {
#     identifier              = "${var.pjt_name}-dbinstance1"
#     allocated_storage       = 5
#     engine                  = "mysql"
#     engine_version          = "5.7"
#     instance_class          = "db.t2.micro"
#     storage_type            = "gp2"
#     username                = var.wp_db_username
#     password                = var.wp_db_password
#     backup_retention_period = 1
#     vpc_security_group_ids  = [aws_security_group.db_sg.id]
#     db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
#     skip_final_snapshot     = true # trueにしないとdestroyできない
#     # インスタンス削除時にスナップショットをとる（skip_final_snapshot = false）ならば、合わせてfinal_snapshot_identifierの設定が必要
# }

####################
# RDS DB Instance
####################
resource "aws_db_instance" "db1" {
    allocated_storage       = 20
    storage_type            = "gp2"
    engine                  = "mysql"
    engine_version          = "5.7"
    instance_class          = "db.t2.micro"
    name                    = "wpdb"
    username                = var.wp_db_username
    password                = var.wp_db_password
    parameter_group_name    = aws_db_parameter_group.db_pg.name
    option_group_name       = aws_db_option_group.db_og.name
    multi_az                = false
    db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
    vpc_security_group_ids  = [aws_security_group.db_sg.id]
    backup_retention_period = 5
    backup_window           = "22:29-22:59"
    //DB削除前にスナップショットを作成しない
    skip_final_snapshot = true
    //自動スケーリング上限
    max_allocated_storage = 200
    //接続エンドポイント
    identifier = "wpdb"

    tags = {
        Name = "${var.pjt_name}-rds"
    }
}

####################
# RDS DB Option Group
####################
resource "aws_db_option_group" "db_og" {
    name                 = "${var.pjt_name}-db-og"
    engine_name          = "mysql"
    major_engine_version = "5.7"
}

####################
# RDS DB Parameter Group
####################
resource "aws_db_parameter_group" "db_pg" {
    name   = "${var.pjt_name}-db-pg"
    family = "mysql5.7"
}
