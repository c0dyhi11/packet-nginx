provider "packet" {
    auth_token = var.auth_token
}

data "template_file" "user_data" { 
    template = file("${path.module}/templates/user_data.sh")
}

resource "packet_device" "nginx" {
    hostname = "nginx" 
    plan = var.plan
    facilities = [var.facility]
    operating_system = var.operating_system
    billing_cycle = var.billing_cycle
    project_id = var.project_id
    user_data = data.template_file.user_data.rendered
}

