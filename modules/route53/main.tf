resource "aws_route53_zone" "this" {
  name = var.zone_name

  dynamic "vpc" {
    for_each = var.private_zone && var.vpc_id != null ? [1] : []
    content {
      vpc_id = var.vpc_id
    }
  }

  tags = var.tags
}

resource "aws_route53_record" "this" {
  for_each = {
    for record in var.records :
    "${record.name}-${record.type}" => record
  }

  zone_id = aws_route53_zone.this.zone_id
  name    = each.value.name
  type    = each.value.type

  ttl     = lookup(each.value, "ttl", null)
  records = lookup(each.value, "records", null)

  dynamic "alias" {
    for_each = lookup(each.value, "alias", null) != null ? [each.value.alias] : []
    content {
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
      evaluate_target_health = alias.value.evaluate_target_health
    }
  }
}
