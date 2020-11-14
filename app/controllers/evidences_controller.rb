class EvidencesController < ApplicationController
  def new
    @post = Post.new
    @post.evidences.build
  end

  def create
    @post = Post.new(evidence_params)
    if @post.save
      redirect_to evidence_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def evidence_params
    params.require(:post).permit(:text,
                                [evidences_attributes: [:post_id,
                                  :source,
                                  :informant,
                                  :source_updated_on,
                                  :level,
                                  :fact_or_opinion,
                                  :data_type,
                                  :reference]])
  end
end
