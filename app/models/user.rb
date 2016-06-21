class User < ActiveRecord::Base
    before_save {self.email = self.email.downcase}
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    validates :introduction, length: {maximum: 100}
    VALID_WEBSITE_REGEX = /https?:\/\/[\S]+/
    validates :website, format: {with: VALID_WEBSITE_REGEX}, allow_blank: true, on: :update
    validates :location, length: {minimum: 2, maximum: 20}, allow_blank: true, on: :update
    validates :birthday, :introduction, :location, :website, absence: true, on: :create
    validates :introduction, length: {maximum: 100}, allow_blank: true, on: :update

    has_secure_password
end
