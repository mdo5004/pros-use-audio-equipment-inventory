class RigPolicy < ApplicationPolicy
    attr_reader :viewer, :rig
    
    def initialize(viewer,rig)
        @viewer = viewer
        @rig = rig
    end
    
    def update?
        @viewer.admin? || @rig.user == @viewer
    end
    
    def index?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def show?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def edit?
        @viewer.admin? || @rig.user == @viewer
    end
    def new?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def create?
        @viewer.admin? || @viewer.moderator? || @viewer.user?
    end
    def destroy?
        @viewer.admin? || @rig.user == @viewer
    end
end