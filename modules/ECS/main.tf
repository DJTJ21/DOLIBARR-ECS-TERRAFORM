# ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "${var.environment}-ecs-cluster"
  tags = {
    Environment = var.environment
  }
}

# ECS Task definition

resource "aws_ecs_task_definition" "dolibarr_task" {
  family                   = "${var.environment}-dolibarr"
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn

  container_definitions = jsonencode([
    {
      name        = "dolibarr"
      image       = var.dolibarr_image
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "DOLI_DB_HOST"
          value = var.db_host
        },
        {
          name  = "DOLI_DB_HOST_PORT"
          value =  tostring(var.db_port) 
        },
        {
          name  = "DOLI_DB_USER"
          value = var.db_user
        },
        {
          name  = "DOLI_DB_NAME"
          value = var.db_name
        }
      ]
      secrets = [
        {
          name      = "DOLI_DB_PASSWORD"
          valueFrom = var.db_password_arn
        },
        {
          name      = "DOLI_ADMIN_PASSWORD"
          valueFrom = var.admin_password_arn
        }
      ]
      volumes = [
        {
          name      = "dolibarr-docs"
          host      = null
          dockerVolumeConfiguration = {
            autoprovision = true
            driver        = "local"
          }
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/${var.environment}-dolibarr"
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])

  volume {
    name = "dolibarr-docs"
  }
}

resource "aws_ecs_service" "dolibarr_service" {
  name            = "${var.environment}-dolibarr"
  cluster         = aws_ecs_cluster.main.arn
  task_definition = aws_ecs_task_definition.dolibarr_task.arn
  launch_type     = "FARGATE"

  desired_count = var.desired_count

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = ["${var.security_group_ids}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "dolibarr"
    container_port   = 80
  }

  depends_on = [aws_ecs_task_definition.dolibarr_task]
}
