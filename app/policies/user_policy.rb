class PostPolicy < ApplicationPolicy
    attr_reader :viewer, :user
    
    def initialize(viewer,user)
        @viewer = viewer
        @user = user
    end
    
    def update?
        @viewer.admin? || @user == @viewer
    end
    
    def index?
        @viewer.admin? || @viewer.moderator?
    end
    def show?
        @viewer.admin? || @viewer.moderator? || @user == @viewer
    end
    def edit?
        @viewer.admin? || @user == @viewer
    end
    def new?
        true
    end
    def create?
        true
    end
    def destroy?
        # only admins can destroy users
        # admins can't destroy themselves through site
        @viewer.admin? && @user != @viewer
    end
end