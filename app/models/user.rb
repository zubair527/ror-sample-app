class User < ActiveRecord::Base
  before_save {self.email.downcase!}

  validates(:name, presence: true, length: {maximum: 50 })
  validates(:email, presence:  true, length: {maximum: 255 }, uniqueness: {case_sensitive: false})
end
