class Department < ActiveRecord::Base
  has_many :places

  def slug
    "#{id}-#{name.parameterize}"
  end

  def image
    ActionController::Base.helpers.asset_path("department-#{self.code}.jpeg")
  end
end
