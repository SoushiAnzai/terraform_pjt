variable "region" {
    description = "AWSリージョン"
    default = "ap-northeast-1"
    type = string
}

# vpc
variable "vpc_cidr" {
    description = "VPCのCIDR"
    type = string
}