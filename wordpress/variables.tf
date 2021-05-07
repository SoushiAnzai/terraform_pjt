variable "region" {
    description = "AWSリージョン"
    default = "ap-northeast-1"
    type = string
}

variable "aws_key_name" {
    description = "キーペア名前"
    type = string
}

# vpc
variable "pjt_name" {
    description = "Project名"
    type = string
}

# vpc
variable "vpc_cidr" {
    description = "VPCのCIDR"
    type = string
}

# subnet
variable "subnet_cidr" {
    description = "subnetのCIDR"
    type = string
}

# route_table
variable "rtb_public_cidr" {
    description = "route_table_publicのCIDR"
    type = string
}

# DB
variable "wp_db_username" {
    description = "wordpress用DBユーザー名"
    type = string
}

variable "wp_db_password" {
    description = "wordpress用DBパスワード"
    type = string
}

# EC2
variable "ec2_ami_web_public" {
    description = "webインスタンス(public)用AMIID"
    type = string
}

variable "ec2_instance_type_web" {
    description = "webインスタンスタイプ"
    type = string
}
