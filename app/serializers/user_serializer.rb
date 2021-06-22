class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :image, :email

  has_many :suggestions
  has_many :friends
end
