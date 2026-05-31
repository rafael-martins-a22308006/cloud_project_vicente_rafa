import boto3

sqs = boto3.client(
    "sqs",
    region_name="us-east-1"   
)

QUEUE_URL = "https://sqs.us-east-1.amazonaws.com/634119227761/cloud-project-queue"

sqs.send_message(
    QueueUrl=QUEUE_URL,
    MessageBody="Hello from Service A"
)

print("Mensagem enviada")