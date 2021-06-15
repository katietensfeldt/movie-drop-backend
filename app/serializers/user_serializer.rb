class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :image, :email, :friends, :pending_friendships
end
