class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :suggestions, foreign_key: "recipient_id", dependent: :destroy

  # Will return all friendships where the friendship has been confirmed/approved
  def approved_friendships
    Friendship.where("sender_id = ? OR recipient_id = ?", id, id).where(confirmed: true)
  end

  # Will return all friendships where the friendship has not been confirmed/approved
  def pending_friendships
    Friendship.where("sender_id = ? OR recipient_id = ?", id, id).where(confirmed: false)
  end

  ## THIS IS JUST A TEMPORARY WORKAROUND - at this point, the :friendships association isn't working, this method is only to get a workaround temporarily
  def all_friendships
    Friendship.where("sender_id = ? OR recipient_id = ?", id, id)
  end

  # Will return all friends (other user, not the friendship)
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
