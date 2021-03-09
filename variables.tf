variable "env" {
  type    = string
  default = "dev"
}
variable "name" {
  type = string
}
variable "stages" {
  type    = list(object({
    type     = string
    name     = string
    provider = string
    config   = map(string)
    inputs   = list(string)
    outputs  = list(string)
  }))
  default = []
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
