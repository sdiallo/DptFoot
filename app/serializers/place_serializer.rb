class PlaceSerializer < ApplicationSerializer
  attributes :id, :name, :address, :slug, :department_slug, :participations_with_users

  has_one :department
  has_many :participations

  def slug
    object.slug
  end

  def department_slug
    object.department.slug
  end

  def participations_with_users
    object.participations.todays.map do |participation|
      ParticipationSerializer.new(participation, except: :user_id, root: false)
    end
  end

end
