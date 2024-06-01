resource "aws_sns_topic" "iam_rotation_sns" {
  name = var.sns_topic_name
}