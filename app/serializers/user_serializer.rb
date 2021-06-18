class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :image, :email, :friends
end
