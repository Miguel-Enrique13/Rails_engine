# Rails Engine

## Introduction

Rails Engine is a backend API for a fictitious company developing an E-Commerce Application. Rails engine exposes 11 endpoints for the Front End to consume.

The API uses Services and MVC design patterns to keep the code organized. It makes use of the serializers to present the information. 

## Table of Contents
1. [Items CRUD](#items) 
    - [GET Item /Index](#get-item-/index)
    - [SHOW Item /:id](#show-item-/:id)
    - [POST Item](#post-item)
    - [UPDATE Item /:id](#update-item-/:id)
    - [DELETE Item /:id](#delete-item-/:id)
1. [Merchants CRUD](#Merchants)
    - [GET Merchant /Index](#get-merchant-/index)
    - [SHOW Merchant /:id](#show-merchant-/:id)
    - [POST Merchant](#post-merchant)
    - [UPDATE Merchant /:id](#update-merchant-/:id)
    - [DELETE Merchant /:id](#delete-merchant-/:id)

## Items
### GET Item /Index

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

### SHOW Item /:id

Returns a JSON object with a single item. JSON object contains the following attributes: item id, name, description, unit price and merchant id. 
It also contains additional data like: transaction id, invoice id, and invoice items id.

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
|----|---|---|

| `description` | Required | String |
|----|---|---| 

| `unit_price` | Required | Float |
|----|---|---| 

| `Merchant_id` | Required | integer |
|----|---|---|

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
  <summary> Sample Response: </Summary>
  
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

### UPDATE Item /:id

Updates items JSON object with new item information such as: name, description, and unit_price.

Parameters:

| `name` | Required | String |
|----|---|---|

| `description` | Required | String |
|----|---|---| 

| `unit_price` | Required | Float |
|----|---|---| 

Sample Request: `localhost:3000/api/v1/items/2484?name=Update item&description=lorem ipsum&unit_price=50.00`

<details>
  <summary> Sample Params: </summary>
  
  ```json
  name: update item
  description: lorem ipsum
  unit_price: 50.00
  ```  
</details>

<details>
  <summary> Sample Response: </Summary>
  
  ```json
  {
    "data": {
        "id": "2484",
        "type": "item",
        "attributes": {
            "id": 2484,
            "name": "Update item",
            "description": "lorem ipsum",
            "unit_price": 50.0,
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

### DELETE Item /:id

Deletes Item object

Sample Request: `localhost:3000/api/v1/items/2484`

Sample Response: **Empty**

### GET Merchant /Index

returns a JSON object with a list of all the merchants. JSON object contains the following attributes: merchant id, and name. 
It also contains additional data like: invoices, items, invoice_items and transactions.

Sample Request: `localhost:3000/api/v1/merchants`

### SHOW Merchant /:id

returns a JSON object with a single merchant. JSON object contains the following attributes: merchant id, and name. 
It also contains additional data like: invoices, items, invoice_items and transactions.

Sample Request: `localhost:3000/api/v1/merhcants/101`

<details>
  <summary> Sample Response: </summary>
    
```json
    {
    "data": {
        "id": "101",
        "type": "merchant",
        "attributes": {
            "id": 101,
            "name": "new merchant"
        },
        "relationships": {
            "invoices": {
                "data": []
            },
            "items": {
                "data": []
            },
            "invoice_items": {
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

### POST Merchant
Returns JSON object with merchant information such as: merchant id, and name.

Parameters:

| `name` | Required | String |
|----|---|---|

Sample Request: `localhost:3000/api/v1/merchants?name=new merchant`

<details>
    <summary> Sample Response:</summary>
    
```json
    {
    "data": {
        "id": "101",
        "type": "merchant",
        "attributes": {
            "id": 101,
            "name": "new merchant"
        },
        "relationships": {
            "invoices": {
                "data": []
            },
            "items": {
                "data": []
            },
            "invoice_items": {
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

### UPDATE Merchant /:id

Updates merchant JSON object with new item information such as: name.

Parameters:

| `name` | Required | String |
|----|---|---|

Sample Request: `localhost:3000/api/v1/merchants/101?name=update merchant`

<details> 
    <summary> Sample Response:</summary>
    
 ```json
    {
    "data": {
        "id": "101",
        "type": "merchant",
        "attributes": {
            "id": 101,
            "name": "update merchant"
        },
        "relationships": {
            "invoices": {
                "data": []
            },
            "items": {
                "data": []
            },
            "invoice_items": {
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


### DELETE Merchant /:id

Deletes Merhcant object

Sample Request: `localhost:3000/api/v1/merchants/2484`

Sample Response: **Empty**
  















