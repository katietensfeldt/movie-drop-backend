class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :friendships, dependent: :destroy
  has_many :suggestions, dependent: :destroy


  def approved_friendships
    Friendship.where("sender_id = ? OR recipient_id = ?", id, id).where(confirmed: true)
  end

  def pending_friendships
    Friendship.where("sender_id = ? OR recipient_id = ?", id, id).where(confirmed: false)
  end

  def friends
    collection = []
    approved_friendships.each do |friendship|
      if friendship.sender_id == id
        collection << friendship.recipient
      else
        collection << friendship.sender
      end
    end
    collection
  end

end
