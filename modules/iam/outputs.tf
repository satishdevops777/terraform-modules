output "user_name" {
  value = try(aws_iam_user.this[0].name, null)
}

output "user_access_key_id" {
  value     = try(aws_iam_access_key.this[0].id, null)
  sensitive = true
}

output "user_secret_access_key" {
  value     = try(aws_iam_access_key.this[0].secret, null)
  sensitive = true
}

output "role_name" {
  value = try(aws_iam_role.this[0].name, null)
}

output "role_arn" {
  value = try(aws_iam_role.this[0].arn, null)
}
