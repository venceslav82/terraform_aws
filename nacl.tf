resource "aws_network_acl" "test-ACL" {
  vpc_id = aws_vpc.Test-VPC.id
}

resource "aws_network_acl_rule" "inbound22" {
  network_acl_id = aws_network_acl.test-ACL.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}
resource "aws_network_acl_rule" "inbound80" {
  network_acl_id = aws_network_acl.test-ACL.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}