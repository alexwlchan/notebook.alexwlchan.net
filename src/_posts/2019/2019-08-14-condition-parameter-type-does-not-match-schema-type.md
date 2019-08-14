---
layout: post
title: "Condition parameter type does not match schema type"
date: 2019-08-14 16:48:07 +0100
tags: aws aws:dynamodb
---

If you get the following error from DynamoDB:

> One or more parameter values were invalid: Condition parameter type does not match schema type

it's a sign that you're requesting the wrong type of paramater in a query.

In boto3/Python, it's code like:

```python
import boto3

dynamodb = boto3.client("dynamodb")

dynamodb.query(
    TableName="storage-staging-ingests",
    KeyConditions={
        "id": {
            "AttributeValueList": [{"N": "1"}],
            "ComparisonOperator": "EQ"
        }
    }
)
```

In Scala-land, we've seen this when we pass a case class as the key (e.g. `ReplicaPath`) and the custom DynamoFormat is wrong or missing, so it tries to query on a map instead of a string/int.
