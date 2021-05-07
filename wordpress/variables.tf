variable "region" {
    description = "AWSリージョン"
    default = "ap-northeast-1"
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