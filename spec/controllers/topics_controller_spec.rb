require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic, user: my_user) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns Topic.all to topic" do
      get :index
      expect(assigns(:topics)).to eq([my_topic])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_topic.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_topic.id}
      expect(response).to render_template :show
    end

    it "assigns my_topic to @topic" do
      get :show, {id: my_topic.id}
      expect(assigns(:topic)).to eq(my_topic)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "initializes @topic" do
      get :new
      expect(assigns(:topic)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of topics by 1" do
      expect{ post :create, topic: {string: Faker::StarWars.character} }.to change(Topic,:count).by(1)
    end

    it "assigns Topic.last to @topic" do
      post :create, topic: {string: Faker::StarWars.character}
      expect(assigns(:topic)).to eq Topic.last
    end

    it "redirects back to topics index path" do
      post :create, topic: {string: Faker::StarWars.character}
      expect(response).to redirect_to topics_path
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: my_topic.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: my_topic.id}
      expect(response).to render_template :edit
    end

    it "assigns topic to be updated to @topic" do
      get :edit, {id: my_topic.id}
      topic_instance = assigns(:topic)
      expect(topic_instance.id).to eq my_topic.id
      expect(topic_instance.title).to eq my_topic.title
    end
  end

  describe "PUT update" do
    it "updates topic with expected attributes" do
      new_title = Faker::StarWars.character

      put :update, id: my_topic.id, topic: {title: new_title}

      updated_topic = assigns(:topic)
      expect(updated_topic.id).to eq my_topic.id
      expect(updated_topic.title).to eq new_title
    end

    it "redirects to the updated topic" do
      new_title = Faker::StarWars.character

      put :update, id: my_topic.id, topic: {title: new_title}
      expect(response).to redirect_to my_topic
    end
  end

  describe "DELETE destroy" do
    it "deletes the topic" do
      delete :destroy, {id: my_topic.id}
      count = Topic.where({id: my_topic.id}).size
      expect(count).to eq 0
    end

    it "redirects to topics index" do
      delete :destroy, {id: my_topic.id}
      expect(response).to redirect_to topics_path
    end
  end
end
