# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :inet
#  last_sign_in_ip     :inet
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  username            :string
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#

class User < ApplicationRecord
  second_level_cache version: 1.0, expires_in: 1.week
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable, :recoverable,
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  attr_accessor :login

  validates :username,
            :presence => true,
            :uniqueness => {
                :case_sensitive => false
            }
  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  private
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      conditions[:username].downcase! if conditions[:username]
      where(conditions.to_h).first
    end
  end
end
