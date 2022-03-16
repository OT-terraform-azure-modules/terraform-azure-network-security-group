variable "client_id" {
  description = "Azure Client Id "
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Azure client secret"
  type        = string
  sensitive   = true
}
variable "subscription_id" {
  description = "Azure Subscription"
  type        = string
  sensitive   = true
}
variable "tenant_id" {
  description = "Azure tanent id"
  type        = string
  sensitive   = true
}