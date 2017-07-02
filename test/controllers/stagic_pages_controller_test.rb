require 'test_helper'

class StagicPagesControllerTest < ActionDispatch::IntegrationTest

  test 'root' do
    get root_path
    assert_response :ok
  end

end
