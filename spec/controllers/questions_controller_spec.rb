require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  it 'populates an array of all questions' do
    question1 = FactoryGirl.create(:question)
    question2 = FactoryGirl.create(:question)

    get :index

    expect(assigns(:questions)).to match_array([question1, question2])
  end

  it 'renders index wiew' do
    get :index
    expect(response).to render_template :index
  end

end
