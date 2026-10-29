variable "domain_name" {
  description = "The domain name for the minesweeper site"
  type        = string
  default     = "bombtag.bastionforge.com"
}

variable "hosted_zone_id" {
  description = "Route 53 hosted zone ID for bastionforge.com"
  type        = string
  default     = "Z05616888O7BYTCZT9PE"
}
