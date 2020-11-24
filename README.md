# Rails Engine

## Introduction

Rails Engine is a backend API for a fictitious company developing an E-Commerce Application. Rails engine exposes 11 endpoints for the Front End to consume.

The API uses Services and MVC design patterns to keep the code organized. It makes use of the serializers to present the information. 

## Table of Contents
1. [Items](#items) 
  - [GET /Index](#get-/index)
  - [SHOW /:id](#show-/:id)
  - [POST Item](#post-item)

## Items
### GET /Index

Returns a JSON object with a list of all the items. JSON object contains the following attributes: item id, name, description, unit price and merchant id. 
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
    ]
 }
 ```
</details>

### SHOW /:id

Returns a JSON object with a single item. JSON object contains the following attributes: item id, name, description, unit price and merchant id. 
It also contains additional data like: transaction id, invoice id, and invoice items id.

Parameters:

|`Item id`| required | String |
|---|---|---|

Sample Request: `localhost:3000/api/v1/items/1819`

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
    ]
 }
 ```
</details>

### POST item

Returns JSON object with item information such as: item id, name, description, unit price, and merchant id.

Parameters:


| `name` | Required | String |
|---|---|---|

| `description` | Required | String |
|---|---|---|

| `unit_price` | Required | Float |
|---|---|---|

| `Merchant_id` | Required | integer |
|---|---|---|

Sample Request: `localhost:3000/api/v1/items?name=new item&description=lorem ipsum&unit_price=15.00&merchant_id=10`

<details>
  <summary> Sample Params: </summary>
  
  ```json
  name: new item
  description: lorem ipsum
  unit_price: 15.00
  merchant_id: 10
  ```  
</details>

<details>
  <summary> Sample Response </Summary>
  
  ```json
  {
    "data": {
        "id": "2484",
        "type": "item",
        "attributes": {
            "id": 2484,
            "name": "new item",
            "description": "lorem ipsum",
            "unit_price": 15.0,
            "merchant_id": 10
        },
        "relationships": {
            "merchant": {
                "data": {
                    "id": "10",
                    "type": "merchant"
                }
            },
            "invoice_items": {
                "data": []
            },
            "invoices": {
                "data": []
            },
            "transactions": {
                "data": []
            }
        }
    }
}
  ```
</details>





