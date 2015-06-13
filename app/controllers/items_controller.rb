class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id]) #IDでデータベースを検索する
  end
  def index
    @items = Item.all
  end
  def new
    @item = Item.new #空のレコードを渡す
  end
  def create
    # formからなデータを受け取る
    @item = Item.new(item_params)
    # これを保存する
    @item.save #saveをしたら、id, created_at, updated_atが加えられる
    # show.html.erbに飛ばす
    redirect_to "/items/#{@item.id}"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id]) #DBの旧データを読み出す。
    @item.update_attributes(item_params)
    redirect_to "/items/#{@item.id}"

  end

  private
  def item_params
    # params.require(:key).permit(:filter)
    params.require(:item).permit(  #フォームに入力されたデータを取得して、フィルタリング
      :name,
      :description,
      :price,
      :seller_id,
      :email,
      :image_url
    )
  end
end
