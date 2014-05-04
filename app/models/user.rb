class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validate :uid_and_provider_presence

  # add conditional validation to handle OAuth
  def uid_and_provider_presence
    # IMPLEMENTME
  end
end
