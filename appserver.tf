resource "aws_instance" "app-server" {
  count                  = var.node_count
  ami                    = var.ami_id[var.region]
  instance_type          = var.app_server_instance_type
  monitoring             = true
  user_data              = <<EOF
    #!/bin/bash
    yum install httpd -y
    /sbin/chkconfig --levels 235 httpd on
    service httpd start
    instanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
    region=$(curl http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')
    echo "<h1>$instanceId from $region</h1>" > /var/www/html/index.html
  EOF
  vpc_security_group_ids = [aws_security_group.web-access.id]

  tags = {
    Name = "Webserver ${count.index + 1}"
  }
}

resource "aws_security_group" "web-access" {
  name        = "web-access"
  description = "Allow port 80 access from outside world"
}

resource "aws_security_group_rule" "allow-webserver-access" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web-access.id
}

resource "aws_security_group_rule" "allow-webserver-access-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web-access.id
}
