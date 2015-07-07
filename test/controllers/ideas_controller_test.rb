require 'test_helper'

class IdeasControllerTest < ActionController::TestCase
  test 'controller responds to json' do
    get :index, format: :json
    assert_response :success
  end

  test 'index records exist under idea root' do
    get :index, format: :json
    response_body = JSON.parse(response.body)
    assert response_body['idea']
    assert_equal 1, response_body.keys.count
  end

  test 'index returns an array of records' do
    get :index, format: :json
    response_body = JSON.parse(response.body)
    assert_kind_of Array, response_body['idea']
  end

  test 'api can get a single idea' do
    idea = Idea.last
    get :show, format: :json, id: idea.id
    response_body = JSON.parse(response.body)
    assert response_body['idea']
    assert_equal idea.title, response_body['idea']['title']
    assert_equal idea.body, response_body['idea']['body']
  end

  test 'creating a idea through the api' do
    idea = { id: 2, title: 'New Idea', body: 'Something' }
    number_of_ideas = Idea.all.count
    post :create, idea: idea, format: :json
    response_body = JSON.parse(response.body)
    assert response_body['idea']
    assert_equal number_of_ideas + 1, Idea.all.count
  end

  test 'updating a idea through the api' do
    idea = Idea.last
    updated_content = { id: idea.id, title: 'Updated Idea', body: 'Something' }
    put :update, id: idea.id, idea: updated_content, format: :json
    idea.reload
    assert_equal 'Updated Idea', idea.title
  end
end
