class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: %i[admin customer]

  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :movies, dependent: :destroy
  has_one_attached :profile_image

  validates :nickname,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters and numbers" }
  
  def save_movie?(movie:)
    if movies.include?(movie)
      false
    else
      movies << movie
    end
  end

  def active_for_authentication?
    super && active
  end
end