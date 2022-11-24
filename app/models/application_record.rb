class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def encode_token(payload)
    JWT.encode(payload, "secret")
  end
end
