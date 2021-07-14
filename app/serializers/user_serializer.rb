class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :image, :email, :phone_number

  has_many :friends
  has_many :suggestions
end
