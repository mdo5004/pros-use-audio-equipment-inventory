class RigsController < ApplicationController
    def index
    end
    def new
        @rig = Rig.new(user_id: params[:user_id])
        @rig.items.build
    end
    def create
        @rig = Rig.new(user_id: rig_params[:user_id])
        
        if @rig.update_attributes(rig_params)
            redirect_to user_path(@rig.user)
        else
            render :new
        end
    end
    def edit
    end
    def update
    end
    def show
    end
    def destroy
    end
    
    private
    def rig_params
        params.require(:rig).permit(:user_id,:name,:venue,:use,:items => {"item_ids":[]},:items => :name) 
    end
end
