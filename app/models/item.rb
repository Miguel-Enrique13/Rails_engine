class Item < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.single_find(params)
    finder_key = params.keys.first
    if ["name", "description"].include?(finder_key)
      Item.where("LOWER(items.#{finder_key}) LIKE LOWER('%#{params[finder_key]}%')").limit(1)
    else
      Item.where("items.#{finder_key} = #{params[finder_key]}").limit(1)
    end
  end

  def self.multi_find(params)
    finder_key = params.keys.first
    if ["name", "description"].include?(finder_key)
      Item.where("LOWER(items.#{finder_key}) LIKE LOWER('%#{params[finder_key]}%')")
    else
      Item.where("items.#{finder_key} = #{params[finder_key]}")
    end
  end
end
