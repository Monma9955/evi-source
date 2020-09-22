class EvidencesController < ApplicationController
  def new
    @post = Post.new
    @post.evidences.build
  end

  def create
    # 成功した場合は直接showアクションへ遷移予定
    redirect_to root_path
  end
end
