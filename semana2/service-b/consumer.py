import boto3

sqs = boto3.client(
    "sqs",
    region_name="us-east-1"   
)

QUEUE_URL = "https://sqs.us-east-1.amazonaws.com/634119227761/cloud-project-queue"

while True:
    response = sqs.receive_message(
        QueueUrl=QUEUE_URL,
        MaxNumberOfMessages=1,
        WaitTimeSeconds=10
    )

    messages = response.get("Messages", [])

    for msg in messages:
        print("Recebido:", msg["Body"],flush=True)

        sqs.delete_message(
            QueueUrl=QUEUE_URL,
            ReceiptHandle=msg["ReceiptHandle"]
        )