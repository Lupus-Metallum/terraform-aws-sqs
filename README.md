# terraform-aws-sqs
Flexible Terraform module to create an SQS queue with optional deadletter queue and cloudwatch monitoring for deadlead letter messages 

<!-- BEGIN_TF_DOCS -->

<img src="https://raw.githubusercontent.com/Lupus-Metallum/brand/master/images/logo.jpg" width="400"/>



## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.this_deadletter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_sqs_queue.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.this_deadletter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name to use for resources created by this module | `string` | n/a | yes |
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | List of alarm action endpoints | `list(string)` | `[]` | no |
| <a name="input_alarm_description"></a> [alarm\_description](#input\_alarm\_description) | Description to use for the deadletter monitor | `string` | `"Monitors for messages sent to a deadletter queue."` | no |
| <a name="input_alarm_name"></a> [alarm\_name](#input\_alarm\_name) | Description to use for the deadletter monitor | `string` | `"deadletter-alarm"` | no |
| <a name="input_enable_actions"></a> [enable\_actions](#input\_enable\_actions) | Should we enable alarm actions? | `bool` | `false` | no |
| <a name="input_max_receive_count"></a> [max\_receive\_count](#input\_max\_receive\_count) | Number of times a message can be re-received | `number` | `5` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | Number of seconds for message retention | `number` | `86400` | no |
| <a name="input_message_retention_seconds_deadletter"></a> [message\_retention\_seconds\_deadletter](#input\_message\_retention\_seconds\_deadletter) | Number of seconds for message retention of deadletter messages | `number` | `345600` | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | Number of seconds for receive wait time | `number` | `10` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of strings for tags to apply to resources created by this module | `map(string)` | `{}` | no |
| <a name="input_use_cmk"></a> [use\_cmk](#input\_use\_cmk) | Should we use a Customer Managed Key for envelope encryption? | `bool` | `true` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | Number of seconds for message visibility timeout | `number` | `180` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_alarm_arn"></a> [cloudwatch\_alarm\_arn](#output\_cloudwatch\_alarm\_arn) | n/a |
| <a name="output_cloudwatch_alarm_id"></a> [cloudwatch\_alarm\_id](#output\_cloudwatch\_alarm\_id) | n/a |
| <a name="output_kms_key_alias_name"></a> [kms\_key\_alias\_name](#output\_kms\_key\_alias\_name) | n/a |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | n/a |
| <a name="output_sqs_deadletter_queue_arn"></a> [sqs\_deadletter\_queue\_arn](#output\_sqs\_deadletter\_queue\_arn) | n/a |
| <a name="output_sqs_deadletter_queue_id"></a> [sqs\_deadletter\_queue\_id](#output\_sqs\_deadletter\_queue\_id) | n/a |
| <a name="output_sqs_queue_arn"></a> [sqs\_queue\_arn](#output\_sqs\_queue\_arn) | n/a |
| <a name="output_sqs_queue_id"></a> [sqs\_queue\_id](#output\_sqs\_queue\_id) | n/a |
<!-- END_TF_DOCS -->