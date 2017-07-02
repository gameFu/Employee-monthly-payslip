require 'test_helper'
require 'payslip_generator'

class PayslipGeneratorTest < ActiveSupport::TestCase

  def setup
    File.delete test_env_out_path if File.exist?(test_env_out_path)
  end

  def test_env_out_path
    Rails.root.join('test/fixtures/files/payslip_generator_output.csv')
  end

  test 'input file invalid' do
    assert_raise 'PayslipGeneratorError' do
      PayslipGenerator.new('')
    end

    assert_raise 'PayslipGeneratorError' do
      PayslipGenerator.new('asds')
    end
  end

  test 'output csv' do
    out_file = test_env_out_path
    assert_not File.exist? out_file
    PayslipGenerator.new(fixture_path + 'files/input.csv', out_file).generate
    assert File.exist? out_file
    File.delete(out_file)
  end

end
