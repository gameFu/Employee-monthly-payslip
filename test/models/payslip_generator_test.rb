require 'test_helper'
require 'payslip_generator'

class PayslipGeneratorTest < ActiveSupport::TestCase

  test 'input file invalid' do
    assert_raise 'PayslipGeneratorError' do
      PayslipGenerator.new('')
    end

    assert_raise 'PayslipGeneratorError' do
      PayslipGenerator.new('asds')
    end
  end

  test 'output csv' do
    out_file = PayslipGenerator.new.test_env_out_path
    assert_not File.exist? out_file
    # file = Rack::Test::UploadedFile.new(File.join(ActionController::TestCase.fixture_path, 'files/input.csv', 'text/csv')
    # # file = fixture_file_upload( fixture_path + 'files/input.csv', 'text/csv')
    PayslipGenerator.new(fixture_path + 'files/input.csv').generate
    assert File.exist? out_file
    File.delete(out_file)
  end

end
