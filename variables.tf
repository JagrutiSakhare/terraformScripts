variable "project_id" {
  description = "The project ID to host the network in"
}

variable "network_name" {
  description = "The name of the VPC network being created"
}
variable "credentials_file_path" {
  description = "Location of the Google Cloud Platform credentials"
  default     = "project_key.json"
}