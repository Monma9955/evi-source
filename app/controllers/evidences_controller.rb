class EvidencesController < ApplicationController
  def new
    @post = Post.new
    @post.evidences.build
  end

  def create
    @post = Post.new(evidence_params)
    if @post.save
      redirect_to evidence_path(@post.id)
      # sourceがURLのevidenceレコードは短縮URLをShort_urlsテーブルに保存
      @post.evidences.each do | evidence |
        if URI::DEFAULT_PARSER.make_regexp.match(evidence.source).nil?
        else
          client = Bitly::API::Client.new(token: ENV['BITLY_TOKEN'])
          shorturl = client.shorten(long_url: evidence.source)
          @short_url = ShortUrl.new({evidence_id: evidence.id,
                                      url: short_url(evidence.source)})
          # 保存ができなかったパターンの処理は未記載
          @short_url.save
        end
      end
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  def short_url(long_url)
    # bitlyのAPIを使用して短縮URLを作成
    client = Bitly::API::Client.new(token: ENV['BITLY_TOKEN'])
    shorturl = client.shorten(long_url: long_url)
    shorturl.link
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
