class Evidence < ApplicationRecord
  # sourceがURLの場合はshort_urlsテーブルに短縮URLを別途作成する
  after_create :shorten_url_create

  belongs_to :post
  has_one :short_url, dependent: :destroy

  enum level:{ primary: 0, secondary: 1, tertiary: 2 }
  # primary = 一次情報 secondary = 二次情報 tertiary = 三次情報
  enum fact_or_opinion:{ fact: 0, opinion: 1, both: 2 }
  # fact = 事実 opinion = 私見 both = どちらも
  enum data_type:{ verification:0, statistical:1, questionary:2 }
  # verification = 検証(結果) statistical = 統計(結果) questionary = アンケート(結果)

  validates :source, presence: true
  validate  :updated_date_before_today?

  def updated_date_before_today?
    errors.add(:source_updated_on, "は今日以前の日付を選択してください") if source_updated_on.present? && source_updated_on > Date.today
  end

  def it_is_url?
    URI::DEFAULT_PARSER.make_regexp.match(self.source).nil? ? FALSE : TRUE
  end

  def convert_long_url(long_url)
    # bitlyのAPIを使用して短縮URLを作成
    client = Bitly::API::Client.new(token: ENV['BITLY_TOKEN'])
    shorturl = client.shorten(long_url: long_url)
    shorturl.link
  end

  protected

  def shorten_url_create
    # self.sourceがURLの場合はTRUE
    if self.it_is_url?
      @short_url = ShortUrl.new({evidence_id: self.id,
                                  url: convert_long_url(self.source)})
      false unless @short_url.save
    end
  end

end
