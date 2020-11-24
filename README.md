# Rails Engine

## Introduction

Rails Engine is a backend API for a fictitious company developing an E-Commerce Application. Rails engine exposes 11 endpoints for the Front End to consume.

The API uses Services and MVC design patterns to keep the code organized. It makes use of the serializers to present the information. 

## Table of Contents
1. [Items](#items) 
  - [GET /Index](#get-/index)
  - [SHOW /:id](#show-/:id)



## Items
### GET /Index

Returns a JSON object with a list of all the items. JSON object contains the following attributes: item id, name, description, merchant id. 
It also contains additional data like: transaction id, invoice id, and invoice items id.

Sample request: `localhost:3000/api/v1/items`

<details>
  <summary> Sample Response: </summary>
 
 ```json
  {
    "data": [
        {
            "id": "1819",
            "type": "item",
            "attributes": {
                "id": 1819,
                "name": "Item Veritatis Asperiores",
                "description": "Enim est voluptates minus. Repellat ut labore eos eum omnis autem earum. Voluptatibus ratione sed voluptas sunt illum.",
                "unit_price": 516.09,
                "merchant_id": 75
            },
            "relationships": {
                "merchant": {
                    "data": {
                        "id": "75",
                        "type": "merchant"
                    }
                },
                "invoice_items": {
                    "data": [
                        {
                            "id": "8755",
                            "type": "invoice_item"
                        }
                    ]
                },
                "invoices": {
                    "data": [
                        {
                            "id": "1980",
                            "type": "invoice"
                        }
                    ]
                },
                "transactions": {
                    "data": [
                        {
                            "id": "2293",
                            "type": "transaction"
                        },
                        {
                            "id": "2294",
                            "type": "transaction"
                        }
                    ]
                }
            }
        }
        "id": "1313",
        "type": "item",
        "attributes": {
            "id": 1313,
            "name": "Item Impedit Iste",
            "description": "Laborum facilis dignissimos molestiae. Inventore sit et dolor sed. Exercitationem animi mollitia laboriosam. Est illo ullam aliquam qui quisquam. Et dolor maiores recusandae rerum non.",
            "unit_price": 684.91,
            "merchant_id": 58
        },
        "relationships": {
            "merchant": {
                "data": {
                    "id": "58",
                    "type": "merchant"
                }
            },
            "invoice_items": {
                "data": [
                    {
                        "id": "3334",
                        "type": "invoice_item"
                    },
                    {
                        "id": "5538",
                        "type": "invoice_item"
                    },
                    {
                        "id": "7184",
                        "type": "invoice_item"
                    },
                    {
                        "id": "10133",
                        "type": "invoice_item"
                    }
                ]
            },
            "invoices": {
                "data": [
                    {
                        "id": "754",
                        "type": "invoice"
                    },
                    {
                        "id": "1248",
                        "type": "invoice"
                    },
                    {
                        "id": "1617",
                        "type": "invoice"
                    },
                    {
                        "id": "2282",
                        "type": "invoice"
                    }
                ]
            },
            "transactions": {
                "data": [
                    {
                        "id": "884",
                        "type": "transaction"
                    },
                    {
                        "id": "1444",
                        "type": "transaction"
                    },
                    {
                        "id": "1863",
                        "type": "transaction"
                    },
                    {
                        "id": "2651",
                        "type": "transaction"
                    }
                ]
    ]
 }
 ```
</details>

### SHOW /:id



