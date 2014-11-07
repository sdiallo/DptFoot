class DepartmentSerializer < ApplicationSerializer
  attributes :id, :name, :code, :slug

  has_many :places

  def slug
    "#{object.id}-#{object.name.parameterize}"
  end

end
