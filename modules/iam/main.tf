resource "aws_iam_user" "this" {
  count = var.create_user ? 1 : 0

  name = var.user_name
  tags = var.tags
}

resource "aws_iam_access_key" "this" {
  count = var.create_user && var.create_access_key ? 1 : 0
  user  = aws_iam_user.this[0].name
}

resource "aws_iam_role" "this" {
  count = var.create_role ? 1 : 0

  name               = var.role_name
  assume_role_policy = var.assume_role_policy
  tags               = var.tags
}

resource "aws_iam_user_policy_attachment" "user_attach" {
  count      = var.create_user ? length(var.managed_policy_arns) : 0
  user       = aws_iam_user.this[0].name
  policy_arn = var.managed_policy_arns[count.index]
}

resource "aws_iam_role_policy_attachment" "role_attach" {
  count      = var.create_role ? length(var.managed_policy_arns) : 0
  role       = aws_iam_role.this[0].name
  policy_arn = var.managed_policy_arns[count.index]
}

resource "aws_iam_user_policy" "inline_user" {
  count = var.create_user && var.inline_policy_json != null ? 1 : 0

  name   = "${var.user_name}-inline-policy"
  user   = aws_iam_user.this[0].name
  policy = var.inline_policy_json
}

resource "aws_iam_role_policy" "inline_role" {
  count = var.create_role && var.inline_policy_json != null ? 1 : 0

  name   = "${var.role_name}-inline-policy"
  role   = aws_iam_role.this[0].name
  policy = var.inline_policy_json
}
