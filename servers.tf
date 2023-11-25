data "aws_ami" "centos" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

data "aws_security_group" "allow-all" {
  name = "allow all"
}
variable "instance_type" {
  default = "t3.micro"
}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = "frontend"
  }
}

variable "zone_id" {
  default = "Z07849831FFYEHNKDVTOV"
}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "frontend-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = "mongodb"
  }
}
resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = "mongodb-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = "catalogue"
  }
}
resource "aws_route53_record" "catalogue" {
  zone_id = var.zone_id
  name    = "catalogue-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = "redis"
  }
}
resource "aws_route53_record" "redis" {
  zone_id = var.zone_id
  name    = "redis-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "user" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = "user"
  }
}
resource "aws_route53_record" "user" {
  zone_id = var.zone_id
  name    = "user-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = "cart"
  }
}
resource "aws_route53_record" "cart" {
  zone_id = var.zone_id
  name    = "cart-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = "mysql"
  }
}
resource "aws_route53_record" "mysql" {
  zone_id = var.zone_id
  name    = "mysql-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = "shipping"
  }
}
resource "aws_route53_record" "shipping" {
  zone_id = var.zone_id
  name    = "shipping-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = "rabbitmq"
  }
}
resource "aws_route53_record" "rabbitmq" {
  zone_id = var.zone_id
  name    = "rabbitmq-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "payment" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = "payment"
  }
}
resource "aws_route53_record" "payment" {
  zone_id = var.zone_id
  name    = "payment-dev.mdevops333.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

output "dns-name-frontend" {
  value = aws_route53_record.frontend.name
}

output "ami_id" {
  value = data.aws_ami.centos.image_id
}

