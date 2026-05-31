import boto3

sqs = boto3.client("sqs")

QUEUE_URL = "http://localhost:5001/data"

sqs.send_message(
    QueueUrl=QUEUE_URL,
    MessageBody="Hello from Service A"
)

print("Mensagem enviada")