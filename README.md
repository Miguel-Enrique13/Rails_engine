# Rails Engine

## Introduction

Rails Engine is a backend API for a fictitious company developing an E-Commerce Application. Rails engine exposes 11 endpoints for the Front End to consume.

The API uses Services and MVC design patterns to keep the code organized. It makes use of the serializers to present the information. 

## Table of Contents
[Endpoints] (#endpoints)
  1. [Items] (#items)
  2. 

## Endpoints

### Items - ```GET /Index```

Returns a JSON object with a list of all the items. JSON object contains the following attributes: item id, name, description, merchant id. 
It also contains additional data like: transaction id, invoice id, and invoice items id.



