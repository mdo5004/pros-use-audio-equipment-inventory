class RigsController < ApplicationController
    def index
        @rigs = Rig.all
        authorize @rigs
    end
    def new
        @rig = Rig.new(user_id: params[:user_id])
        @rig.items.build

        authorize @rig
    end
    def create
        @rig = Rig.new(rig_params)
        authorize @rig
        if @rig.save
            redirect_to user_path(@rig.user)
        else
            @rig.items.clear
            @rig.items.build
            render :new
        end
    end
    def edit
        @rig = Rig.find(params[:id])
        authorize @rig
    end
    def update
        @rig = Rig.find(params[:id])
        authorize @rig
        if @rig.update_attributes(rig_params)
            redirect_to user_path(@rig.user)
        else
            render :edit
        end
    end
    def show
        @rig = Rig.find(params[:id])
        authorize @rig
        respond_to do |f|
            f.html { render :show }
            f.json { render json: @rig }
        end
    end
    def destroy
        @rig = Rig.find(params[:id])
        authorize @rig
        @rig.destroy
        redirect_to root_path
    end

    private
    def rig_params
        params.require(:rig).permit(:user_id,:name,:venue,:use, :item_ids => [], :items_attributes => [:name, :manufacturer, :id]) 
    end
end
