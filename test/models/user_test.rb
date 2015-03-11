require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.create(name: 'test_user', email: 'test_email@email.com', password: 'testPassword', password_confirmation:'testPassword')
  end

  test 'should_be_valid' do
    assert @user.valid?
  end

  test 'name_is_required' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'email_is_required' do
    @user.email = 'a' * 244 + '@example.com' # assuming total allowed email length 255.
    assert_not @user.valid?
  end

  test 'email_should_be_unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


end
