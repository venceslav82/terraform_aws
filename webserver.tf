resource "aws_instance" "WEB-SERVER" {
    //count = var.v-count
    ami = var.v-ami-image
    instance_type = var.v-instance-type
    key_name = var.v-instance-key
    vpc_security_group_ids = [aws_security_group.public-security-group.id]
    subnet_id = aws_subnet.public-network.id
    tags = {
        Name = "WEB-SERVER"
    }
    provisioner "file" {
        source      = "./provision_web.sh"
        destination = "/tmp/provision_web.sh"
        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("terraform-key.pem")
            host = self.public_ip
        }
    }
    provisioner "remote-exec" {
        inline = [
        "chmod +x /tmp/provision_web.sh",
        "/tmp/provision_web.sh"
        ]
        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("terraform-key.pem")
            host = self.public_ip
        }
    }
}