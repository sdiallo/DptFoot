class CreateFriendShips < ActiveRecord::Migration
  def change
    create_table :friend_ships do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :state, default: 0
      t.timestamps
    end
  end
end
