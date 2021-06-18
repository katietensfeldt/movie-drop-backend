class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :confirmed

  belongs_to :sender
  belongs_to :recipient
end
