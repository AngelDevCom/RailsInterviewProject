require "rails_helper"

describe Api::V1::QuestionsController, type: :controller do 
  render_views
  let(:tenant) { FactoryGirl.create(:tenant) }
  let(:user) { FactoryGirl.create(:user) }
  let(:api_key) { FactoryGirl.create(:api_key, tenant_id: tenant.id) }

  describe "POST #index" do 
    context "with valid access token" do
      before do
        request.env["HTTP_AUTHORIZATION"] = api_key.access_token
      end

      it "should response with questions" do 
        question = FactoryGirl.create(:question, :user_id => user.id, :private => false)
        answer = FactoryGirl.create(:answer, :body => "sample_answer", :question_id => question.id, :user_id => user.id)

        get :index, format: :json
        expected = [
            {
            :id       => question.id,
            :title    =>question.title,
            :answers  => [{
              :id         => answer.id,
              :body       => answer.body,
              :user_id    => user.id,
              :user_name  => user.name
            }]
          }
        ].to_json

        expect(response.body).to eq(expected)
      end

      it "should increase request count" do 
        expected_count = tenant.request_count + 1
        get :index, format: :json
        expect(api_key.tenant.request_count).to eq(expected_count)
      end
    end

    context "with invalid access token" do 
      it "should returns status 401" do 
        request.env["HTTP_AUTHORIZATION"] = 'invalid code'
        get :index, format: :json
        expect_unauthorized_status
      end
    end

    context "without any public questions" do 
      before do
        request.env["HTTP_AUTHORIZATION"] = api_key.access_token
      end
      it "should returns status no_content" do 
        FactoryGirl.create(:question, :user_id => user.id, :private => true)
        get :index, format: :json
        expect_no_content_status
      end
    end

    context "with query paramter" do
      before do
        request.env["HTTP_AUTHORIZATION"] = api_key.access_token
      end
      let(:question) { FactoryGirl.create(title: 'just do it') }
      let(:question1) { FactoryGirl.create(title: 'come hunger, leave ...') }

      it 'should returns correct query result' do
        get :index, {query: 'it'}, format: :json
      end

      it 'should return no content if no result with query' do
        get :index, {query: 'never'}, format: :json
        expect_no_content_status
      end
    end
  end
end 