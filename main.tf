resource "aws_sqs_queue" "this_deadletter" {
  name                              = "${var.name}-deadletter"
  kms_master_key_id                 = var.use_cmk == true ? aws_kms_alias.this[0].name : "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
  message_retention_seconds         = var.message_retention_seconds_deadletter
  tags                              = var.tags
}

resource "aws_sqs_queue" "this" {
  name                              = var.name
  kms_master_key_id                 = var.use_cmk == true ? aws_kms_alias.this[0].name : "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
  message_retention_seconds         = var.message_retention_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  visibility_timeout_seconds        = var.visibility_timeout_seconds

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.this_deadletter.arn
    maxReceiveCount     = var.max_receive_count
  })

  tags = var.tags
}

data "aws_iam_policy_document" "this" {
  count = var.use_cmk == true ? 1 : 0
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [
        "s3.amazonaws.com",
        "events.amazonaws.com",
        "sns.amazonaws.com"
      ]
    }
    actions = [
      "kms:GenerateDataKey",
      "kms:Decrypt"
    ]
    resources = [ "*" ]
  }
}

resource "aws_kms_key" "this" {
  count                   = var.use_cmk == true ? 1 : 0
  description             = "CMK for SQS - ${var.name}"
  deletion_window_in_days = 10
  is_enabled              = true
  enable_key_rotation     = true
  key_usage               = "ENCRYPT_DECRYPT"
  policy                  = data.aws_iam_policy_document.this[0].json

  tags = merge(
    var.tags,
    {
      Name = var.name,
    },
  )
}

resource "aws_kms_alias" "this" {
  count         = var.use_cmk == true ? 1 : 0
  name          = "alias/${var.name}-Key"
  target_key_id = aws_kms_key.this[0].key_id
}

resource "aws_cloudwatch_metric_alarm" "this_deadletter" {
  actions_enabled = var.enable_actions
  alarm_actions = var.alarm_actions
  alarm_description = var.alarm_description
  alarm_name = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  dimensions = {
    "QueueName" = aws_sqs_queue.this_deadletter.name
  }
  evaluation_periods = 1
  metric_name = "ApproximateNumberOfMessagesVisible"
  namespace = "AWS/SQS"
  period = 60
  statistic = "Maximum"
  threshold = 1
  treat_missing_data = "missing"
  }