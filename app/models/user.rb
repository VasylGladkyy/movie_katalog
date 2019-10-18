class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: %i[admin customer]

  def change_status
    if active
      update_attributes(active: false)
    else
      update_attributes(active: true)
    end
  end

  def active_for_authentication?
    super && active
  end
end
