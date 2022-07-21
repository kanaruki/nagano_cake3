class Publics::HomesController < ApplicationController
  def top
    #     #例 Discographyテーブルの1番最初のレコードを取得
    # @discography = Discography.first
    
    # #例 Discographyテーブルの先頭から3件のレコードを取得
    # @discography = Discography.first(3)
    
    # #例 Discographyテーブルの1番末尾から4件のレコードを取得
    @new_item = Item.last(4)
  end
  def about
  end
  
end
