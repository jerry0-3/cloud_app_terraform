output "ecr_backend_url" { value = aws_ecr_repository.backend.repository_url }
output "ecr_frontend_url" { value = aws_ecr_repository.frontend.repository_url }
output "frontend_url" { value = "http://${aws_lb.main.dns_name}" }
output "backend_url" { value = "http://${aws_lb.main.dns_name}:8080" }
output "ecs_cluster_name" { value = aws_ecs_cluster.main.name }
output "backend_service_name" { value = aws_ecs_service.backend.name }
output "frontend_service_name" { value = aws_ecs_service.frontend.name }