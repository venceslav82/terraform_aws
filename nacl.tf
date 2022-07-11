# Create default VPC Network ACL
resource "aws_network_acl" "test-ACL" {
    vpc_id = aws_vpc.Test-VPC.id
    
    egress {
        protocol = "-1"
        rule_no = 100
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "tcp"
        rule_no = 100
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 22
        to_port = 22
    }
    ingress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 80
        to_port = 80
    }
    ingress {
        protocol = "tcp"
        rule_no = 300
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 443
        to_port = 443
    }
    subnet_ids = [
        aws_subnet.public-network.id,
        aws_subnet.private-network.id
    ]
}