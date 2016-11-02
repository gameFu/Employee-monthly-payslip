require 'test_helper'

class UploadControllerTest < ActionDispatch::IntegrationTest
  test "no file redirect to root_path" do
    post upload_path, params: {
      upload: {
      }
    }
    assert_redirected_to root_path
  end
end
