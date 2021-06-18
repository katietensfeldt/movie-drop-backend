class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  #These two below are not working because it can't associate the user_id
  has_many :friendships
  has_many :suggestions, foreign_key: "recipient_id"

  # Will return all friendships where the friendship has been confirmed/approved
  def approved_friendships
    Friendship.where("sender_id = ? OR recipient_id = ?", id, id).where(confirmed: true)
  end

  # Will return all friendships where the friendship has not been confirmed/approved
  def pending_friendships
    Friendship.where("sender_id = ? OR recipient_id = ?", id, id).where(confirmed: false)
  end

  def all_friendships
    Friendship.where("sender_id = ? OR recipient_id = ?", id, id)
  end

  # Will return all friends (other user, not the friendship)
  def friends
    collection = []
    approved_friendships.each do |friendship|
      if friendship.sender_id == id
        collection << {id: friendship.recipient.id, name: friendship.recipient.name, username: friendship.recipient.username, image: friendship.recipient.image, email: friendship.recipient.email}
      else
        collection << {id: friendship.sender.id, name: friendship.sender.name, username: friendship.sender.username, image: friendship.sender.image, email: friendship.sender.email}
      end
    end
    collection
  end

end
