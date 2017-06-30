require 'test_helper'

class UploadControllerTest < ActionDispatch::IntegrationTest
  test "no file redirect to root_path" do
    post upload_path, params: {
      upload: {
      }
    }
    assert_redirected_to root_path
    assert_equal '没有上传文件', flash[:danger]
  end

  test 'file upload' do
    out_file = PayslipGenerator.new.test_env_out_path
    assert_not File.exist? out_file
    file = fixture_file_upload( fixture_path + 'files/input.csv', 'text/csv')
    post upload_path, params: {
      upload: {
        file: file
      }
    }
    assert File.exist? out_file
    File.delete(out_file)
    assert_response 302
  end

  test 'upload file mini type is not csv' do
    out_file = PayslipGenerator.new.test_env_out_path
    assert_not File.exist? out_file
    file = fixture_file_upload( fixture_path + 'files/input.pdf', 'text/csv')
    post upload_path, params: {
      upload: {
        file: file
      }
    }
    assert_not File.exist? out_file
    assert_response 302
    assert_equal '文件类型错误', flash[:danger]
  end
end
