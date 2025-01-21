variable "install_name" {
  type        = string
  description = "The name of this install. Will be used for the EKS cluster, various tags, and other resources."
  default     = ""
}

variable "iam_role_arn" {
  type        = string
  description = "The IAM Role to get EKS credentials with/for."
  default     = ""
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster to get EKS credentials for."
  default     = ""
}

variable "yaml_body" {
  type        = string
  description = "The yaml body of the manifest."
  default     = ""
}
