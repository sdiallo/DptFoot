class FriendShipSerializer < ApplicationSerializer
  attributes :id, :sender_id, :receiver_id, :state, :sender, :receiver

end
