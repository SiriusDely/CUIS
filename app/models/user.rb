# frozen_string_literal: true

class User < ApplicationRecord
  ROLES = %i[super_admin manager cu_admin branch_head hr member_service teller].freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :trackable, :validatable

  attr_accessor :login

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # Only allow letter, number, underscore and punctuation.
  validates :username, format: { with: /^[a-zA-Z0-9_\.]*$/, multiline: true }
  validate :validate_username
  validates :first_name, :last_name, presence: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  # use this instead of email_changed? for rails >= 5.1
  def will_save_change_to_email?
    false
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(username) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:username)
      where(conditions.to_h).first
    end
  end

  def roles=(roles)
    roles = [*roles].map(&:to_sym)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

  protected

  def validate_username
    errors.add(:username, :invalid) if User.where(email: username).exists?
  end
end
