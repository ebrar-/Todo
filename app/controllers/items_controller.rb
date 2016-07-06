class ItemsController < ApplicationController
	before_action :set_item , except: [:index , :create]
  def index
  	@items = Item.all
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	@item.save
  	@item.user_id = current_user
  	redirect_to items_path
  end


  private

  def set_item
  	@item = Item.find(params[:id])
  end

  def item_params
  	params.require(:item).permit(:content)
  end
end
