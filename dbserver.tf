resource "aws_instance" "DB-SERVER" {
    //count = var.v-count
    ami = var.v-ami-image
    instance_type = var.v-instance-type
    key_name = var.v-instance-key
    vpc_security_group_ids = [aws_security_group.private-security-group.id]
    subnet_id = aws_subnet.private-network.id
    tags = {
        Name = "DB-SERVER"
    }
  
    /*
    provisioner "file" {
        source      = "./provision_db.sh"
        destination = "/tmp/provision_db.sh"
        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("terraform-key.pem")
            host = self.public_ip
        }
    }
    provisioner "remote-exec" {
        inline = [
        "chmod +x /tmp/provision_db.sh",
        "/tmp/provision_db.sh"
        ]
        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("terraform-key.pem")
            host = self.public_ip
        }
    }
    */
}