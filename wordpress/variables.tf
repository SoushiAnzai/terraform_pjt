variable "region" {
    description = "AWSリージョン"
    default = "ap-northeast-1"
    type = string
}

variable "vpc_cidr" {
    description = "VPCのCIDR"
    default = "10.0.0.0/16"
}