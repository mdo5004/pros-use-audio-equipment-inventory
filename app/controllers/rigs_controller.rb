class RigsController < ApplicationController
    def index
        @rigs = Rig.all
        # authorize @rig
    end
    def new
        @rig = Rig.new(user_id: params[:user_id])
        @rig.items.build
        # authorize @rig
    end
    def create
        @rig = Rig.new(user_id: rig_params[:user_id])
        # authorize @rig
        if @rig.update_attributes(rig_params)
            redirect_to user_path(@rig.user)
        else
            render :new
        end
    end
    def edit
        @rig = Rig.find(params[:id])
        # authorize @rig
    end
    def update
        @rig = Rig.find(params[:id])
        # authorize @rig
        if rig_params[:name].empty?
            render :edit, :alert => "Rig must have a name"
        else
            if @rig.update_attributes(rig_params)
                redirect_to user_path(@rig.user)
            else
                render :edit
            end
        end
    end
    def show
        @rig = Rig.find(params[:id])
        # authorize @rig

    end
    def destroy
        @rig = Rig.find(params[:id])
        # authorize @rig
        @rig.destroy
    end

    private
    def rig_params
        params.require(:rig).permit(:user_id,:name,:venue,:use,:items => {"item_ids":[]},:items => :name) 
    end
end
