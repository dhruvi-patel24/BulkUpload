class ItemsController < ApplicationController
  def index
    @items = Item.all
    # respond_to do |format|
    #   format.xlsx {
    #     response.headers[
    #       'Content-Disposition'
    #     ] = "attachment; filename='demo.xlsx'"
    #   }
    #   format.html { render :index }
    # end
  end
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to item_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :quantity)
    end
end
