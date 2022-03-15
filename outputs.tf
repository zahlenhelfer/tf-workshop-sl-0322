output "Werbung" {
  value = "Test Test Test..."
}

output "app_server_ip_addr" {
  value = aws_instance.app-server.*.public_ip
}
