require 'test_helper'

class ProjectSearchTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ProjectSearch.new.valid?
  end
end
