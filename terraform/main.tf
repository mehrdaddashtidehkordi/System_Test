terraform {
  required_version = ">= 1.0" 
}
resource "local_file" "devops_demo" {
  content  = "DevOps Infrastructure as Code"
  filename = "${path.module}/output.txt"
}
