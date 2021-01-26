class PostsController < ApplicationController
  def index
    #seedで入れたデータはcreated_atが同じ時間のためidで並べ替え
    #ログイン機能未実装のためPostデータはallで取得
    if params[:sort] == nil || params[:sort] == "desc"
      @posts = Post.all.order('id DESC')
      @sort = "asc"
    elsif params[:sort] == "asc"
      @posts = Post.all.order('id ASC')
      @sort = "desc"
    end
  end
end
