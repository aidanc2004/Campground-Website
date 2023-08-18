# TODO: Add better way to make admin users than rails console

class User < ApplicationRecord
  has_many :reservations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_admin?
    self.role == "admin"
  end

  # Make sure a user is a admin before continuing
  def authenticate_admin
    if !self.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end
  end
end
