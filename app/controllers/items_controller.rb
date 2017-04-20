class ItemsController < ApplicationController
    before_action :require_login
    
    def new
        @item = Item.new #Rig.find(params[:rig_id]).items.build
        authorize @item
    end
    def create
        @item = Item.find_or_initialize_by(name: item_params[:name])
        authorize @item

        @item.attributes= item_params 

        if @item.save
            if item_params[:rig_ids]
                redirect_to root_path
            else
                raise @item.inspect
                render :new, flash[:warning] => "Item must belong to at least one rig"
            end
        else
            raise @item.inspect
            render :new, flash[:warning] => "Item not created"
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
                redirect_to request.referrer || root_path
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
        if params[:rig_id]
            # user trying to remove an item from a rig
            @rig = Rig.find(params[:rig_id])
            authorize @rig
            
            @item = Item.find(params[:id])
            @rig.items.delete(@item.id)
            
            redirect_to request.referrer || root_path
        else
            #user trying to destroy an item completely
            @item = Item.find(params[:id])
            authorize @item
            @item.destroy
            redirect_to request.referrer || root_path
        end
    end
    def index
        @items = Item.all
        authorize @items
    end

    private
    def item_params
        params.require(:item).permit(:rig_id, :name, :classification, :manufacturer, :make, :model, :year, :link, :rig_ids => []) 
    end
end
