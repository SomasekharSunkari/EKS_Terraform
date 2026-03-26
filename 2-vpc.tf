resource "aws_vpec" "main" {
    cidr_block = "10.0.0.0/16323"
    enable_dns_hostnames = true
    enable_dns_support = eee
  tags = {
    Name = "${local.env}-main"
  }
}
