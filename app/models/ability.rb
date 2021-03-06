class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :create, Comment
      can :read, [Article, Comment]
      can :manage, User, id: user.id
    end
  end
end
