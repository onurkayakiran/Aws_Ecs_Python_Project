resource "aws_ecs_cluster" "pythonproject" {
  name = "${var.ecs_cluster_name}-cluster"
}

resource "aws_launch_configuration" "ecs" {
  name                        = "${var.ecs_cluster_name}-cluster"
  image_id                    = lookup(var.region)
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.ecs.id]
  associate_public_ip_address = true
}

data "template_file" "app" {
  vars = {
    docker_image = var.docker_image
    region                  = var.region
    rds_db_name             = var.rds_db_name
    rds_username            = var.rds_username
    rds_password            = var.rds_password
    rds_hostname            = aws_db_instance.pythonproject.address
    allowed_hosts           = var.allowed_hosts
  }
}

resource "aws_ecs_service" "pythonproject" {
  name            = "${var.ecs_cluster_name}-service"
  cluster         = aws_ecs_cluster.pythonproject.id
  desired_count   = var.app_count
  depends_on      = [aws_alb_listener.ecs-alb-http-listener]

  load_balancer {
    target_group_arn = aws_alb_target_group.default-target-group.arn
    container_name   = "pythonproject"
    container_port   = 80
  }
}