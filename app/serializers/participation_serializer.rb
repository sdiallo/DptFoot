class ParticipationSerializer < ApplicationSerializer
  attributes :id, :user_id, :place_id, :user

  def user
    selected = ['id', 'username', 'email', 'slug', 'updated_at']
    object.user.attributes.select!{ |key, value| selected.include?(key.to_s) }
  end
end
