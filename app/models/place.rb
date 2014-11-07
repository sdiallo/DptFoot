class Place < ActiveRecord::Base
  belongs_to :department
  has_many :participations

  def slug
    "#{id}-#{name.parameterize}"
  end
end
