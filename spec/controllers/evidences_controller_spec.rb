require 'rails_helper'

describe EvidencesController do
  describe 'GET #new' do
    before do
      get :new
    end

    it "@postに期待した値が入っていること" do
      expect(assigns(:post)).to be_an_instance_of Post
    end

    it "new.html.hamlに遷移すること" do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context '投稿に成功した場合' do
      subject {
          post :create,
          params: @params_nested
        }

      before do
        @evidences_params = { evidences_attributes: { "0": attributes_for(:evidence) } }
        @params_nested = { post: attributes_for(:post).merge(@evidences_params) }
      end

      it "postとevidenceを保存すること" do
        expect { subject }.to change(Post, :count).by(1).and change(Evidence, :count).by(1)
      end

      it "show.html.hamlに遷移すること" do
        subject
        expect(response).to redirect_to evidence_path(assigns(:post).id)
      end
    end

    context '投稿に失敗した場合' do
      subject {
        post :create,
        params: invalid_params
      }

      let(:invalid_params) { { post: attributes_for(:post, text: nil),
                              evidences_attributes: evidence_params } }
      let(:evidence_params) { { "0": attributes_for(:evidence, source: nil) } }

      it "Postを保存しないこと" do
        expect { subject }.not_to change(Post, :count)
      end

      it "Evidenceを保存しないこと" do
        expect { subject }.not_to change(Evidence, :count)
      end

      it "new.html.hamlに遷移すること" do
        subject
        expect(response).to render_template :new
      end
    end
  end
end