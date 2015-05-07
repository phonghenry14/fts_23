class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, :all
    else
      can [:read, :update], User, id: user.id
      can [:read, :update], Examination, user_id: user.id
      can [:create], Examination
    end
  end
end
