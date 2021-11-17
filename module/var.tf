variable "email_address" {
    default = "0.75"
}

variable "project_id" {}

variable "region" {}

variable "cpu_enabled" {
    default = 1
}
variable "ip_enabled" {
    default = 1
}
variable "ssd_pd_enabled" {
    default = 1
}
variable "t4_enabled" {
    default = 1
}
variable "p4_enabled" {
    default = 1
}
variable "k80_enabled" {
    default = 1
}
variable "v100_enabled" {
    default = 1
}

variable "cpu_threshold" {
    default = "0.75"
}
variable "ip_threshold" {
    default = "0.75"
}
variable "ssd_pd_threshold" {
    default = "0.75"
}
variable "t4_threshold" {
    default = "0.75"
}
variable "p4_threshold" {
    default = "0.75"
}
variable "k80_threshold" {
    default = "0.75"
}
variable "v100_threshold" {
    default = "0.75"
}
