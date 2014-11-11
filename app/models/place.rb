class Place < ActiveRecord::Base
  belongs_to :department, touch: true
  has_many :participations

  def slug
    "#{id}-#{name.parameterize}"
  end
end
