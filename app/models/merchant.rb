class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.single_find(params)
    Merchant.where("LOWER(merchants.name) LIKE LOWER('%#{params[:name]}%')").limit(1)
  end

  def self.multi_find(params)
    Merchant.where("LOWER(merchants.name) LIKE LOWER('%#{params[:name]}%')")
  end

  def self.most_revenue(params)
    Merchant
    .joins(invoices: [:invoice_items, :transactions])
    .select('merchants.id, merchants.name, SUM(invoice_items.quantity * invoice_items.unit_price) as Revenue')
    .where("invoices.status = 'Shipped' and transactions.result = 'success'")
    .group('merchants.id')
    .order('Revenue DESC')
    .limit(params[:quantity].to_i)
  end

  def self.most_items_sold(params)
    Merchant
    .joins(invoices: [:invoice_items, :transactions])
    .select('merchants.id, merchants.name, SUM(invoice_items.quantity) as Items_sold')
    .where("invoices.status = 'Shipped' and transactions.result = 'success'")
    .group('merchants.id')
    .order('Items_sold DESC')
    .limit(params[:quantity].to_i)
  end

  def self.revenue_with_time_range(params)
    InvoiceItem
    .joins(:transactions)
    .where("invoices.status = 'Shipped' and transactions.result = 'success' and transactions.created_at > '%#{params[:start]}%' and transactions.created_at < '%#{params[:end]}%'")
    .sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def self.merchant_revenue(params)
    InvoiceItem
    .joins(:transactions)
    .where("invoices.status = 'Shipped' and transactions.result = 'success' and invoices.merchant_id = '#{params[:id]}'")
    .sum('invoice_items.quantity * invoice_items.unit_price')
  end

end
