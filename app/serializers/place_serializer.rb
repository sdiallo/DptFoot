class PlaceSerializer < ApplicationSerializer
  attributes :id, :name, :address, :town, :slug, :department_slug, :participations_with_users, :participations_count_today, :participations_ids_of_todays

  def slug
    object.slug
  end

  def department_slug
    object.department.slug
  end

  def participations_ids_of_todays
    object.participations.todays.pluck(:user_id)
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
