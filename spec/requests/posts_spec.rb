require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "works! (now write some real specs)" do
      user = User.create!(
        email: "eric@gmail.com",
        password: "password"
      )
      # get posts_index_path
      # expect(response).to have_http_status(200)


      Post.create!(
        
        title: "title",
        body: "body",
        image: "image",
        user_id: user.id
      )
      
      get "/api/posts"
      posts = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(posts.length).to eq(1)
    end
  end
  
  describe "POST /posts" do
    it "should create a new post in the db" do
      user = User.create!(
        email: "john@gmail.com",
        password: "password"
      )
      
      jwt = JWT.encode(
        {
          user_id: user.id,
          exp: 24.hours.from_now.to_i
        },
        Rails.application.credentials.fetch(:secret_key_base),
        "HS256"
      )
      
      post "/api/posts", params: {
        title: "title",
        body: "body",
        image: "image",
      },
      headers: {"Authorization" => "Bearer #{jwt}"}
      post = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(posts["title"]).to eq("the title")
    end
  end
end

