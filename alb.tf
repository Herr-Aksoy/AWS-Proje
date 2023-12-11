resource "aws_lb_target_group" "proje2_tg" {
  name     = "proje2-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.proje2_vpc.id
  target_type = "instance"
health_check {
  healthy_threshold = 2
  unhealthy_threshold = 3
}

}

resource "aws_lb_listener" "proje2_listener" {
  load_balancer_arn = aws_lb.proje2_alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.proje2_tg.arn
  }
}

resource "aws_lb" "proje2_alb" {
  name               = "proje2alb"
  ip_address_type    = "ipv4"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.proje2_ALB_Sec_Group.id]
  subnets            = [for subnet in aws_subnet.proje2_public_subnet : subnet.id]

}



######### ALB OLUSTURULMASI ICIN GEREKLI DIGER BILESENLER  #########


# resource "aws_vpc" "proje2_vpc" {
#   cidr_block       = "90.90.0.0/16"
#   enable_dns_support = true                    ## Bu olmasada olur sanki
#   enable_dns_hostnames = true               ## VPC icerisinde bütün resourcelarin birbiri ile göresebilmeleri icin.
  
#   tags = {
#     Name = "proje2-vpc"
#   }
# }

# resource "aws_subnet" "proje2_public_subnet" {
#   count = 2
#   vpc_id = aws_vpc.proje2_vpc.id
#   cidr_block = count.index == 0 ? "90.90.10.0/24" : "90.90.20.0/24"
#   availability_zone = count.index == 0 ? "us-east-1a" : "us-east-1b"
#   tags = {
#     Name = count.index == 0 ? "proje2-public-subnet-1A" : "proje2-public-subnet-1B"
#   }
# }

# resource "aws_subnet" "proje2_private_subnet" {
#   count = 2
#   vpc_id = aws_vpc.proje2_vpc.id
#   cidr_block = count.index == 0 ? "90.90.11.0/24" : "90.90.21.0/24"
#   availability_zone = count.index == 0 ? "us-east-1a" : "us-east-1b"
#   tags = {
#     Name = count.index == 0 ? "proje2-private-subnet-1A" : "proje2-private-subnet-1B"
#   }
# }

# resource "aws_security_group" "proje2_ALB_Sec_Group" {
#   vpc_id      = aws_vpc.proje2_vpc.id
#   name        = "proje2_ALB_Sec_Group"
#   description = "HTTP and HTTPS ports from anywhere"

#   ingress {
#     description = "HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "HTTPS"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }


# resource "aws_internet_gateway" "proje2_igw" {
#   vpc_id = aws_vpc.proje2_vpc.id
#   tags = {
#     Name = "proje2-IGW"
#   }
# }