class PlaceSerializer < ApplicationSerializer
  attributes :id, :name, :address, :town, :slug, :department_slug, :participations_with_users, :participations_count_today

  has_one :department

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

  def participations_count_today
    object.participations.todays.count
  end

end
