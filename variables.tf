variable "profile_name" {
  description = "Value of the name CLI AWS client profile"
  type        = string
  default     = "xminer"
}

/**
  Default Region is Ohio : us-east-2
*/
variable "region" {
  description = "Define which is use region"
  type        = string
  default     = "us-east-2"
}
