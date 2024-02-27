module "vpc" {
  source = "./modules/vpc"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  prisub1_cidr = var.prisub1_cidr
  prisub1_name = var.prisub1_name
  prisub2_cidr = var.prisub2_cidr
  prisub2_name = var.prisub2_name
  pubsub1_cidr = var.pubsub1_cidr
  pubsub1_name = var.pubsub1_name
  pubsub2_cidr = var.pubsub2_cidr
  pubsub2_name = var.pubsub2_name
  pubrt_name = var.pubrt_name
  az1 = var.az1
  az2 = var.az2
  igw_name = var.igw_name
  eip1_name = var.eip1_name
  eip2_name = var.eip2_name
  nat1_name = var.nat1_name
  nat2_name = var.nat2_name
  rtpri1_name = var.rtpri1_name
  rtpri2_name = var.rtpri2_name
}

module "loadbalancer" {
  source = "./modules/loadbalancer"
  vpc_id = module.vpc.vpc_id
  name = var.lb_name
  public_subnet_ids = module.vpc.public_subnet_ids
  port = var.port
  protocol = var.protocol
  tg_type = var.tg_type
  target_group = module.loadbalancer.tg_arn
  tg_name = var.tg_name
}

module "ecs_cluster" {
  source = "./modules/cluster"
  name = var.cluster_name
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "ecs-task-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

module "ecs_task-definition" {
  source = "./modules/task-definition"
  taskdefinition_name = var.taskdefinition_name
  container_name = var.container_name
  container_port = var.container_port
  cpu = var.cpu
  memory = var.memory
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  docker_repo = var.docker_repo
  region = var.region
}

resource "aws_security_group" "service-sg" {
  name        = "example-task-security-group"
  vpc_id      = module.vpc.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = var.container_port
    to_port         = var.container_port
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ecs_service" {
  source = "./modules/service"
  name = var.service_name
  desired_tasks = 2
  arn_security_group = aws_security_group.service-sg.id
  ecs_cluster_id = module.ecs_cluster.ecs_cluster_id
  arn_target_group = module.loadbalancer.tg_arn
  arn_task_definition = module.ecs_task-definition.arn_task_definition
  subnets_id = module.vpc.private_subnet_ids
  container_name = var.con_name
  container_port = var.con_port
}