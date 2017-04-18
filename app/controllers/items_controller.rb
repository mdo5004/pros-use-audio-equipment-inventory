class ItemsController < ApplicationController
    def new
        @item = Item.new #Rig.find(params[:rig_id]).items.build
        authorize @item
    end
    def create
        @item = Item.new(item_params)
        authorize @item
        
        if @item.save
            if item_params[:rig_id]
                redirect_to rig_item_path(item_params[:rig_id])
            else
                redirect_to user_path(current_user)
            end
        else
            render :new, flash[:alert] => "Item not created"
        end
    end
    def edit
        @item = Item.find(params[:id])
    end
    def update
        @item = Item.find(params[:id])
        authorize @item

        if @item.update_attributes(item_params)
            if item_params[:rig_id]
                redirect_to rig_item_path(item_params[:rig_id])
            else
                redirect_to user_path(current_user)
            end        
        else
            render :edit
        end

    end
    def show
        @item = Item.find(params[:id])
        authorize @item
    end
    def destroy
        @item = Item.find(params[:id])
        authorize @item
        @item.destroy
    end
    def index
        @items = Item.all
        authorize @items
    end

    private
    def item_params
        params.require(:item).permit(:rig_id, :name, :classification, :manufacturer, :make, :model, :year, :link) 
    end
end
