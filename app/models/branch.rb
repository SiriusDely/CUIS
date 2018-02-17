class Branch < ApplicationRecord
  validates :full_name, presence: true
  validates :short_name, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :credit_union
  has_many :members, dependent: :nullify
end
