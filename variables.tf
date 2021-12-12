variable "location" {
  type        = string
  description = "common location where all resources to be deployed under the resource grpup"
  default     = "westeurope"
}
variable "asp-tier" {
  type        = string
  description = "Pricing Tier for App service Plan"
  default     = "PremiumV2"

}
variable "asp-size" {
  type        = string
  description = "Size for the App service Plan"
  default     = "P1v2"
}
variable "asp-kind" {
  type        = string
  description = "OS for the App service Plan"
  default     = "Windows"
}