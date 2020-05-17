# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  active                 :boolean          default(TRUE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  nickname               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("customer")
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

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
            format: { with: /\A[a-zA-Z0-9]+\z/, message: 'only allows letters and numbers' }

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
