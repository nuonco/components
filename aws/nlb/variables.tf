variable "region" {
  type        = string
  description = "AWS region the NLB lives in (from the sandbox)."
}

variable "install_id" {
  type        = string
  description = "Nuon install ID; used for resource tagging and to scope the public-subnet lookup."
}

variable "vpc_id" {
  type        = string
  description = "VPC the NLB and target group live in (sandbox vpc.id output)."
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block; allowed as the source for NodePort ingress (sandbox vpc.cidr output)."
}

variable "public_subnet_ids" {
  type        = string
  description = "Comma- or space-delimited list of public subnet IDs for the internet-facing NLB (sandbox vpc.public_subnet_ids output)."
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name (sandbox cluster.name output). Used to name the NLB resources and to discover the managed node group ASG to attach as targets."
}

variable "cluster_security_group_id" {
  type        = string
  description = "EKS cluster security group ID (sandbox cluster.cluster_security_group_id output). The NodePort ingress rule is added here so the NLB can reach the nodes."
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN for the TLS listener, from the standalone certificate component (certificate.public_domain_certificate_arn output)."
}

variable "node_port" {
  type        = number
  default     = 30080
  description = "NodePort the sandbox-preview service is exposed on; the NLB target group forwards TCP traffic here."
}

variable "listener_port" {
  type        = number
  default     = 443
  description = "Public TLS listener port on the NLB."
}
