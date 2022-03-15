resource "aws_instance" "db-server" {
  count                  = var.deploy_database_as_ec2 ? 1 : 0
  ami                    = var.ami_id[var.region]
  instance_type          = var.app_server_instance_type
  monitoring             = true
  user_data              = <<EOF
    #!/bin/bash
  EOF
  vpc_security_group_ids = [aws_security_group.web-access.id]

  tags = {
    Name = "Database-Server"
  }
}
