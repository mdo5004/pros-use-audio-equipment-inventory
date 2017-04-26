class ItemPolicy < ApplicationPolicy
    attr_reader :viewer, :item
    
    def initialize(viewer,item)
        @viewer = viewer
        @item = item
    end
    
    def update?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    
    def index?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def show?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def edit?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def new?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def create?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def destroy?
        @viewer.admin?
    end
end