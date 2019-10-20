class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: %i[admin customer]

  has_many :reviews
  has_one_attached :profile_image

  validates :nickname,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters and numbers" }

  def active_for_authentication?
    super && active
  end
end