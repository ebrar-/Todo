class ItemsController < ApplicationController
	before_action :set_item , except: [:index , :create]
  before_action :authentice? , only: [:complete , :create]
  def index
  	@items = Item.all
  	#@item = Item.new
  end

  def create
    	@item = Item.new(item_params)
    	if @item.save
    	 @item.user_id = current_user
    	 redirect_to items_path
      else
        redirect_to :back
      end
  end

  def complete
  	@item.update_attributes(is_completed: @item.is_completed ^= true ) 
  	redirect_to items_path
  end

  def destroy
    @item.destroy
    redirect_to :back
  end

  private

  def set_item
  	@item = Item.find(params[:id])
  end

  def item_params
  	params.require(:item).permit(:content , :user_id)
  end

  def authentice?
     if !(user_signed_in?)
        redirect_to root_path
      end
  end
end
