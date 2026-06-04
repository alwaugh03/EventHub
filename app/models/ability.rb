# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

  user ||= User.new

  can :read, Event
  can :read, Venue
  can :read, Category
  can :read, Review

  if user.persisted?
    can :create, Event
    can [:update, :destroy], Event, organizer_id: user.id
    can :create, Registration
    can [:update, :destroy], Registration, user_id: user.id
    can :create, Review
    can [:upate, :destroy], Review, user_id: user.id
    can :manage, User, id: user.id

    if user.role == 1
      can :manage, :all
    end
  end






    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
