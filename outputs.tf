output "web-server-public-ip" {
  value = aws_instance.WEB-SERVER.public_ip
}
output "web-server-public-dns" {
  value = aws_instance.WEB-SERVER.public_dns
}
output "web-server-private-ip" {
    value = aws_instance.WEB-SERVER.private_ip
}