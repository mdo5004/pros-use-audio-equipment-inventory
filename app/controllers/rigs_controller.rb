class RigsController < ApplicationController
    def index
    end
    def new
        @rig = Rig.new(user_id: params[:user_id])
    end
    def create
    end
    def edit
    end
    def update
    end
    def show
    end
    def destroy
    end
end
