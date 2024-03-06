output "vpc_id" {
  value = aws_vpc.proidhi_vpc.id
}

output "public_subnet_id" {
  value = local.public_subnet_ids[0]
}

output "private_subnet_id" {
  value = local.private_subnet_ids[0]
}

output "security_group_id" {
  value = aws_security_group.k3s-sg.id
}