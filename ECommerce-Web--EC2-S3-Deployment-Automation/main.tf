

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "E-Commerce-VPC"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet1"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "IGW-Ecommerce"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "route_ecommerce"
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id = aws_subnet.sub1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id = aws_subnet.sub2.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "sg-ecommerce" {
  vpc_id = aws_vpc.my_vpc.id
  name_prefix = "web-sg"
  ingress {
    description = "Allow TCP Port 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow SSH Port 22"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "sg-ecommerce"
  }
}

resource "aws_s3_bucket" "Ayush-S3-Ecommerce-2024" {
  bucket = "ayush-s3-ecommerce-2024"
  tags = {
    name = "Ecommerce-S3"
  }
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.Ayush-S3-Ecommerce-2024.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::ayush-s3-ecommerce-2024",
          "arn:aws:s3:::ayush-s3-ecommerce-2024/*"
        ]
      }
    ]
  })
}

resource "aws_instance" "webserver1" {
  instance_type = "t2.micro"
  ami = "ami-0e86e20dae9224db8"
  vpc_security_group_ids = [aws_security_group.sg-ecommerce.id]
  subnet_id = aws_subnet.sub1.id
  user_data = base64encode(file("user_data1.sh"))
}

resource "aws_instance" "webserver2" {
  instance_type = "t2.micro"
  ami = "ami-0e86e20dae9224db8"
  vpc_security_group_ids = [aws_security_group.sg-ecommerce.id]
  subnet_id = aws_subnet.sub2.id
  user_data = base64encode(file("user_data2.sh"))
}

resource "aws_lb" "my_lb" {
  name               = "ecommerece-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-ecommerce.id]
  subnets            = [aws_subnet.sub1.id, aws_subnet.sub2.id]

  tags = {
    Name = "ecommerece-lb"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "mytg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.webserver1.id
  port             = 80
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
  }
}

output "loadbalancerdns" {
  value = aws_lb.my_lb.dns_name
}
