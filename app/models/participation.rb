class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :place, touch: true

  scope :todays, -> () { where('created_at::date = ?', Date.today) }

end
