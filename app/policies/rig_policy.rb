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
        @viewer.admin? || @viewer.moderator?
    end
    def show?
        @viewer.admin? || @viewer.moderator? || @rig.user == @viewer
    end
    def edit?
        @viewer.admin? || @rig.user == @viewer
    end
    def new?
        true
    end
    def create?
        true
    end
    def destroy?
        @viewer.admin? || @rig.user == @viewer
    end
end