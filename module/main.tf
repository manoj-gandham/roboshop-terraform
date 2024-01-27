resource "aws_instance" "instance" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = var.components_name
  }
}
resource "null_resource" "provisioner" {
  depends_on = [aws_instance.instance,aws_route53_record.records]
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "root"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }

    inline = [
      "rm -rf roboshop-shell",
      "git clone https://github.com/manoj-gandham/roboshop-shell.git",
      "cd roboshop-shell",
      "sudo bash ${var.components_name}.sh ${var.password}"
    ]
  }
}
resource "aws_route53_record" "records" {
  zone_id = "Z08267471ZUUM4K7Q0L0O"
  name    = "${var.components_name}-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip]
}
