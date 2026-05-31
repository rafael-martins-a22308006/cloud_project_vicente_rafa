import boto3

sqs = boto3.client("sqs")

QUEUE_URL = "http://localhost:5001/data"

while True:
    response = sqs.receive_message(
        QueueUrl=QUEUE_URL,
        MaxNumberOfMessages=1,
        WaitTimeSeconds=10
    )

    messages = response.get("Messages", [])

    for msg in messages:
        print("Recebido:", msg["Body"])

        sqs.delete_message(
            QueueUrl=QUEUE_URL,
            ReceiptHandle=msg["ReceiptHandle"]
        )