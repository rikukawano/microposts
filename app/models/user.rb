class User < ActiveRecord::Base
    before_save {self.email = self.email.downcase}
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    validates :introduction, length: {maximum: 100}
    VALID_WEBSITE_REGEX = /https?:\/\/[\S]+/
    validates :website, format: {with: VALID_WEBSITE_REGEX}
    
    has_secure_password
end
