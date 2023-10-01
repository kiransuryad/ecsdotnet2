resource "aws_ecr_repository" "this" {
  name = var.ecr_repository_name
  tags = merge(var.mandatory_tags, var.optional_tags)

  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Expire untagged images"
        action       = { type = "expire" }
        selection = {
          tagStatus   = "untagged"
          countType   = "imageCountMoreThan"
          countNumber = 5
        }
      },
      {
        rulePriority = 2
        description  = "Keep last 30 images"
        action       = { type = "expire" }
        selection = {
          tagStatus   = "any"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = 30
        }
      }
    ]
  })
}
