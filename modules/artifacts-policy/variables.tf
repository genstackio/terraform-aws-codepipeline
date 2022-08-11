variable "role_name" {
  type = string
}
variable "pipeline_bucket" {
  type = string
}
variable "policy_statements" {
  type = list(
    object({
      actions   = list(string),
      resources = list(string),
      effect    = string
    })
  )
  default = []
}
