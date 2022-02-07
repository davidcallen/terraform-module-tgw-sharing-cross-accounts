variable "environment" {
  description = "Environment information e.g. account IDs, public/private subnet cidrs"
  type = object({
    name                         = string
    account_id                   = string # Environment Account IDs are used for giving permissions to those Accounts for resources such as AMIs
    resource_name_prefix         = string
    resource_deletion_protection = bool # For some environments  (e.g. Core, Customer/production) want to protect against accidental deletion of resources
    default_tags                 = map(string)
  })
  default = {
    name                         = ""
    account_id                   = ""
    resource_name_prefix         = ""
    resource_deletion_protection = true
    default_tags                 = {}
  }
}
variable "resource_name_prefix" {
  type    = string
  default = ""
}
variable "tgw_arn" {
  type    = string
  default = ""
}
variable "share_with_account_ids" {
  type    = list(string)
  default = []
}
variable "global_default_tags" {
  description = "Global default tags"
  default     = {}
  type        = map(string)
}