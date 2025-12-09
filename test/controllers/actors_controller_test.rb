require "test_helper"

class ActorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    post "/users.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password", admin: true }
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
  end
  
  test "index" do 
    get "/actors.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Actor.count, data.count
  end

  test "show" do 
    get "/actors/#{Actor.first.id}.json"
    assert_response 200
  end

test "create" do 
    assert_difference "Actor.count", 1 do
      post "/actors.json", params: { first_name: "John",last_name: "Smith", image: "picture.jpeg", known_for: " Titanic" }
      assert_response 201
    end

    delete "/sessions.json"
    post "/actors.json", params: { first_name: "John",last_name: "Smith", image: "picture.jpeg", known_for: " Titanic" }
    assert_response 401
  end

  test "update" do
    actor = Actor.first
    put "/actors/#{actor.id}.json", params: {first_name: "Jared"}
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Jared", data["first_name"]

    delete "/sessions.json"
    put "/actors/#{actor.id}.json", params: {first_name: "Name"} 
    assert_response 401
  end

  test "destroy" do
    assert_difference "Actor.count", -1 do
      delete "/actors/#{Actor.first.id}.json"
      assert_response 200
    end

    delete "/sessions.json"
    delete "/actors/#{Actor.first.id}"
    assert_response 401
  end
end
