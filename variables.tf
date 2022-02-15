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
variable "default_tags" {
  description = "Default tags"
  default     = {}
  type        = map(string)
}