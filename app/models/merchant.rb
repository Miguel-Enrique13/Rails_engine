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
end
