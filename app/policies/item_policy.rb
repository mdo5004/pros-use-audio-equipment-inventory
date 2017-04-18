class ItemPolicy < ApplicationPolicy
    attr_reader :viewer, :item
    
    def initialize(viewer,item)
        @viewer = viewer
        @item = item
    end
    
    def update?
        @viewer.admin? || @item.user == @viewer
    end
    
    def index?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def show?
        @viewer.admin? || @viewer.moderator? || @item.user == @viewer
    end
    def edit?
        @viewer.admin? || @item.user == @viewer
    end
    def new?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def create?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def destroy?
        @viewer.admin? || @item.user == @viewer
    end
end