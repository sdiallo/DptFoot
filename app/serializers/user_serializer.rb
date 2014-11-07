class UserSerializer < ApplicationSerializer
  attributes :id, :email, :username, :authentication_token, :slug, :friends, :friendships, :participations


  def slug
    object.slug
  end

  def participations
    object.participations.todays
  end

  def friends
    selected = [:id, :username, :email, :slug, :updated_at]

    real_friends = object.friends.map{ |user| UserSerializer.new(user, only: selected, root: false) }
    waiting_friends = object.friends(:waiting).map{ |user| UserSerializer.new(user, only: selected, root: false) }
    refused_friends = object.friends(:refused).map{ |user| UserSerializer.new(user, only: selected, root: false) }

    { real_friends: real_friends, waiting_friends: waiting_friends, refused_friends: refused_friends, ids: object.all_friends.pluck(:id) }
  end
end
