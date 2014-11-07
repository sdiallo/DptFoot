class FriendShip < ActiveRecord::Base

  belongs_to :sender, class_name: 'User', foreign_key: :sender_id, touch: true
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id, touch: true


  enum state: [ :waiting, :refused, :active ]

end
