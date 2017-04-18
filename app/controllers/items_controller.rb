class ItemsController < ApplicationController
    def new
        
        @item = Item.new #Rig.find(params[:rig_id]).items.build
    end
    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to rig_item_path(item_params[:rig_id])
        else
            render :new, flash[:alert] => "Item not created"
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
    def index
    end

    private
    def item_params
        params.require(:item).permit(:rig_id, :name, :classification, :manufacturer, :make, :model, :year, :link) 
    end
end
