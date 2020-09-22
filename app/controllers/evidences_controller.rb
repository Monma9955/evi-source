class EvidencesController < ApplicationController
  def new
    @evidences = Evidence.new
  end

  def create
    # 成功した場合は直接showアクションへ遷移予定
    redirect_to root_path
  end
end
