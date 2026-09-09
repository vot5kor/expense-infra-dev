variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "zone_id" {
    default = "Z021448929NMXW4P65UQE"
}

variable "domain_name" {
    default = "zenzee.fun"
}

# variable "password_wo" {
#   description = "Write-Only ... required unless manage_master_user_password is true ..."
#   type        = string
#   sensitive   = true
#   ephemeral   = true
# }

# variable "password_wo_version" {
#   description = "Used together with password_wo to trigger an update. Increment this value when an update to password_wo is required."
#   type        = number
# }