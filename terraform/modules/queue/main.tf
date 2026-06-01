resource "aws_sqs_queue" "dlq" {
  name = "cloud-project-dlq"
}

resource "aws_sqs_queue" "main_queue" {
  name = "cloud-project-queue"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 3
  })
}