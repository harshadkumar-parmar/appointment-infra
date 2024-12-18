variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "appointment-app-repo"
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  type        = string
  default     = "MUTABLE"
}

variable "tags" {
  description = "Tags to apply to the repository"
  type        = map(string)
  default     = {}
}
