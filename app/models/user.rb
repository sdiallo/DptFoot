class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participations
  has_many :invitations_sent, class_name: 'FriendShip', foreign_key: :sender_id
  has_many :invitations_received, class_name: 'FriendShip', foreign_key: :receiver_id


  before_create :ensure_authentication_token

  attr_accessor :login

  def friendships
    FriendShip.where('sender_id = ? OR receiver_id = ?', id, id)    
  end

  def all_friends
    friend_ids = FriendShip.where('sender_id = ?', id).pluck(:receiver_id) + FriendShip.where('receiver_id = ?', id).pluck(:sender_id)  
    User.where(id: friend_ids)
  end

  def friends(state = :active)
    friend_ids = FriendShip.where('sender_id = ?', id).send(state).pluck(:receiver_id) + FriendShip.where('receiver_id = ?', id).send(state).pluck(:sender_id)
    User.where(id: friend_ids)
  end

  def slug
    "#{id}-#{username.parameterize}"
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def ensure_authentication_token
    self.authentication_token = Digest::SHA1.hexdigest([Time.now, rand(100)].join)
  end

end
