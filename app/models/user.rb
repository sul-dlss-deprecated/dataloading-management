class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: {
      with: URI::MailTo::EMAIL_REGEXP,
      allow_blank: true # because the presence validation is the only error we want to show.
    }

  # devise :remote_user_authenticatable
end
