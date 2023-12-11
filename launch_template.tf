resource "aws_launch_template" "proje2_lt" {
  name                   = "template_instance"
  image_id               = "ami-0230bd60aa48260c6"  # BU KISIM DAHA SONRA DATA BLOGU ILE HALLEDILIRSE IYI OLUR
  instance_type          = "t2.micro"
  key_name               = "firstkey"   #var.key_name             # KEYNAME VARIABLE'I OLUSTURULMALI
  vpc_security_group_ids = [aws_security_group.proje2_EC2_Sec_Group.id]
  user_data              = base64encode(data.template_file.proje2_tem_file.rendered)
}

# data "template_file" "proje2_tem_file" {
#   template = file("user-data.sh")               # BU ISIMDE BIR USER DATA DOSYASI OLUSTURULMASI LAZIM
# }


########### LAUNCH TEMPLATE ICIN GEREKLI BILESENLER ###########

# resource "aws_security_group" "proje2_EC2_Sec_Group" {
#   vpc_id      = aws_vpc.proje2_vpc.id
#   name        = "proje2_EC2_Sec_Group"
#   description = "Allows traffic coming from proje2_ALB_Sec_Group Security"

#   ingress {
#     description = "HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     security_groups = [aws_security_group.proje2_ALB_Sec_Group.id]
#   }

#   ingress {
#     description = "HTTPS"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     security_groups = [aws_security_group.proje2_ALB_Sec_Group.id]
#   }

#   ingress {
#     description = "SSH"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
