resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = each.value["name"]
  }
}
resource "aws_route53_record" "frontend" {
  for_each = var.components
  zone_id = "Z07849831FFYEHNKDVTOV"
  name    = "${each.value["name"]}-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}
