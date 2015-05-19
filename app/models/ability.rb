class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Users can manage their own account
    can :manage, User, id: user.id

    # Super-admin account...
    if user.id == 1
      # ...can manage everything...
      can :manage, :all

      # ...but cannot delete their own account
      cannot :destroy, User, id: user.id
    end
  end
end
