class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id]) #IDでデータベースを検索する
  end
  def index
    @items = Item.all
  end
end
