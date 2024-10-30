resource "aws_security_group" "sg" {
  name        = "SG-${var.cluster_name}"
  description = "eks for fastfood project"
  vpc_id      = ""

  # Inbound
  ingress {
    description = "HTTP expose API"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]#["0.0.0.0/0"]
  }

  ingress {
    description = "PostgreSQL RDS"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]
  }

  # Outbound
  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}