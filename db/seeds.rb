# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Transaction.delete_all
Transaction.reset_pk_sequence
InvoiceItem.delete_all
InvoiceItem.reset_pk_sequence
Invoice.delete_all
Invoice.reset_pk_sequence
Customer.delete_all
Customer.reset_pk_sequence
Item.delete_all
Item.reset_pk_sequence
Merchant.delete_all
Merchant.reset_pk_sequence

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |row|
  Merchant.create!(row.to_h)
end

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |row|
  Item.create!(row.to_h)
  price = Item.last.unit_price/100
  Item.last.update(unit_price: price)
end

CSV.foreach('./data/customers.csv', headers: true, header_converters: :symbol) do |row|
  Customer.create!(row.to_h)
end

CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol) do |row|
  Invoice.create!(row.to_h)
end

CSV.foreach('./data/transactions.csv', headers: true, header_converters: :symbol) do |row|
  Transaction.create!(row.to_h)
end

CSV.foreach('./data/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
  InvoiceItem.create!(row.to_h)
  price = InvoiceItem.last.unit_price/100
  InvoiceItem.last.update(unit_price: price)
end
