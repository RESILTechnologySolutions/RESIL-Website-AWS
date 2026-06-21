data "aws_caller_identity" "current" {}

resource "aws_iam_role" "github_actions_deploy" {
  name = "RESILWebsiteGitHubActionsDeployRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:RESILTechnologySolutions/RESIL-Website-AWS:ref:refs/heads/main"
          }
        }
      }
    ]
  })

  tags = {
    Project = "RESIL Website AWS"
    Owner   = "RESIL Technology Solutions"
  }
}

resource "aws_iam_role_policy" "github_actions_deploy" {
  name = "RESILWebsiteDeployPolicy"
  role = aws_iam_role.github_actions_deploy.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowWebsiteBucketDeploy"
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.root_site.arn,
          "${aws_s3_bucket.root_site.arn}/*"
        ]
      },
      {
        Sid    = "AllowCloudFrontInvalidation"
        Effect = "Allow"
        Action = [
          "cloudfront:CreateInvalidation"
        ]
        Resource = aws_cloudfront_distribution.site.arn
      }
    ]
  })
}
