variable "iam_policy_arn" {
  description = "IAM Policy to be attached to role"
  type = list(string)
  default= ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"]
}