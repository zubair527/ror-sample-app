require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.create(name: 'test_user', email: 'test_email@email.com')
  end

  test 'should_be_valid' do
    assert @user.valid?
  end

  test 'name_is_required' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'email_is_required' do
    @user.email = ' '
    assert_not @user.valid?
  end
end
