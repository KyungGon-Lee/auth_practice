class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    if user.has_role? :admin
      can :manage, :all # manage=> 모든 CRUD 작업을 승인, :all => 모든 모델들
      # 위에있는 구문은 아래있는걸 요약한것임
      # can :index, :all
      # can :new, :all
      # can :create, :all
      # can :edit, :all
      # can :update, :all
      # can :show, :all
      # can :destroy, :all
    else
      # can :read, :all
      # 위에있는 구문은 아래있는걸 요약한것임
      # can :index, :all
      # can :show, :all
      # manage가 아닌 경우에 Post를 read,write,edit 가능함
      can :read, Post # :read => :index, :show 작업 승인, Post 모델에 한해
      can :create, Post   #current_user.posts 얘가 쓴 글만 권한을 생김
      can :update, Post

    end

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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
