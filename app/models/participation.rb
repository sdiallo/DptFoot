class Participation < ActiveRecord::Base
  belongs_to :user, touch: true
  belongs_to :place, touch: true

  scope :todays, -> () { where('created_at::date = ?', Date.today) }

end
