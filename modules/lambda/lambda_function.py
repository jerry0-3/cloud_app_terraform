import json
import urllib.parse
import boto3

s3 = boto3.client('s3')

def lambda_handler(event, context):
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = urllib.parse.unquote_plus(event['Records'][0]['s3']['object']['key'], encoding='utf-8')
    size = event['Records'][0]['s3']['object'].get('size', 0)

    if key.endswith('.meta.json'):
        return {'statusCode': 200, 'body': 'Skipped metadata file'}

    print(f"LAMBDA: Przetwarzanie zalacznika S3: {key} ({size} B)")

    metadata_content = {
        "originalFile": key,
        "sizeBytes": size,
        "processedBy": "AWS Lambda Multimedia Processor",
        "status": "VERIFIED"
    }

    s3.put_object(
        Bucket=bucket,
        Key=f"metadata/{key}.meta.json",
        Body=json.dumps(metadata_content),
        ContentType='application/json'
    )

    return {'statusCode': 200, 'body': json.dumps(f'Processed {key}')}