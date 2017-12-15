resource "aws_cloudwatch_event_rule" "ebs_snapshot" {
  name                = "ebs_snapshot"
  description         = "Daily snapshot of ec2 instance volumes"
  schedule_expression = "rate(5 minutes)"
  is_enabled          = true
#  role_arn            = "arn:aws:iam::518406511151:role/restricted_admin"
}

resource "aws_cloudwatch_event_target" "ebs_snapshot" {
  target_id = "ebs_snapshot"
  arn = "arn:aws:automation:${var.region}:340594004420:action/EBSCreateSnapshot/EBSCreateSnapshot_ebs_snapshot"
  input = "\"arn:aws:ec2:${var.region}:340594004420:volume/vol-09e42eebdb6fe836a\""
  rule = "${aws_cloudwatch_event_rule.ebs_snapshot.name}"
}
