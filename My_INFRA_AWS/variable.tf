variable "region" {
    type = string
    default = "us-east-1"
}

variable "ami_id" {
    type = string
    default = "ami-0ecb62995f68bb549"
}

variable "key_name" {
    type = string
    default = "devops-ci-key"
}


variable "security_group_id" {
    type = string
    default = "sg-0adbe7891d486544e"
}
