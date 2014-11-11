class DepartmentSerializer < ApplicationSerializer
  attributes :id, :name, :code, :slug, :image, :places_count

  has_many :places

  def slug
    "#{object.id}-#{object.name.parameterize}"
  end

  def places_count
    object.places.count
  end

end
