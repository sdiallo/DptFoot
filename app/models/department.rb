class Department < ActiveRecord::Base
  has_many :places

  def slug
    "#{id}-#{name.parameterize}"
  end
end
