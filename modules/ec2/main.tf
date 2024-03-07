resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "aws_key" {
  key_name   = "k3s-key-pair"
  public_key = tls_private_key.tls_key.public_key_openssh
}

resource "aws_s3_object" "s3_object" {
  bucket  = "poridhi_test_bucket"
  key     = "k3s-key.pem"
  content = tls_private_key.tls_key.private_key_pem
}

resource "aws_instance" "public" {
  ami           = var.ami
  instance_type = var.instance_type_public
  count         = var.number_of_public_vm
  subnet_id     = var.public_subnet_id
  key_name      = "k3s-key-pair"
  security_groups = [
    var.security_group_id
  ]
  depends_on = [aws_key_pair.aws_key, tls_private_key.tls_key, aws_s3_object.s3_object]
}

resource "aws_eip" "public" {
  count  = var.number_of_public_vm
  domain = "vpc"
}

resource "aws_eip_association" "public" {
  count         = var.number_of_public_vm
  instance_id   = aws_instance.public.*.id[count.index]
  allocation_id = aws_eip.public.*.id[count.index]
}

resource "aws_instance" "private" {
  ami           = var.ami
  instance_type = var.instance_type_private
  count         = var.number_of_private_vm
  subnet_id     = var.private_subnet_id
  key_name      = "k3s-key-pair"
  security_groups = [
    var.security_group_id,
  ]
  depends_on = [aws_key_pair.aws_key, tls_private_key.tls_key, aws_s3_object.s3_object]
}
