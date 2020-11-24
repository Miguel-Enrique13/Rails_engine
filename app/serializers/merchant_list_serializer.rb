class MerchantListSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name
end
