require 'rails_helper'

describe Evidence do
  describe '#create' do
    context '登録可能' do
      it "すべてのカラムが指定通りに存在すれば登録できること" do
        expect(build(:evidence)).to be_valid
      end

      it "informantが存在しなくても登録ができること" do
        evidence = build(:evidence, informant: nil)
        expect(evidence).to be_valid
      end

      it "source_updated_onが存在しなくても登録ができること" do
        evidence = build(:evidence, source_updated_on: nil)
        expect(evidence).to be_valid
      end

      it "source_updated_onが今日の日付の場合登録ができること" do
        evidence = build(:evidence, source_updated_on: Date.today)
        expect(evidence).to be_valid
      end

      it "levelが存在しなくても登録ができること" do
        evidence = build(:evidence, level: nil)
        expect(evidence).to be_valid
      end

      it "fact_or_opinionが存在しなくても登録ができること" do
        evidence = build(:evidence, fact_or_opinion: nil)
        expect(evidence).to be_valid
      end

      it "data_typeが存在しなくても登録ができること" do
        evidence = build(:evidence, data_type: nil)
        expect(evidence).to be_valid
      end

      it "referenceが存在しなくても登録ができること" do
        evidence = build(:evidence, reference: nil)
        expect(evidence).to be_valid
      end
    end

    context '登録不可' do
      it "post_idがない場合は登録できないこと" do
        evidence = build(:evidence, post_id: nil)
        evidence.valid?
        expect(evidence.errors[:post_id]).to include()
      end

      it "sourceがない場合は登録できないこと" do
        evidence = build(:evidence, source: nil)
        evidence.valid?
        expect(evidence.errors[:source]).to include(I18n.t('errors.messages.blank'))
      end

      it "source_updated_onが明日(未来)の日付だと登録ができないこと" do
        evidence = build(:evidence, source_updated_on: Date.tomorrow)
        evidence.valid?
        expect(evidence.errors{:source_updated_on}).to include()
      end
    end
  end
end