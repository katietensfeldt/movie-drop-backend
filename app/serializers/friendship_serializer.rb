class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :confirmed

  ## Will want to customize this to not get quite as much information
  belongs_to :sender
  belongs_to :recipient
end
