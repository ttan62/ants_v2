require 'test_helper'

class ProjectSearchesControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ProjectSearch.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ProjectSearch.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to project_search_url(assigns(:project_search))
  end

  def test_show
    get :show, :id => ProjectSearch.first
    assert_template 'show'
  end
end
