# frozen_string_literal: true

class Transfer < ApplicationRecord
  belongs_to :transferable, polymorphic: true, optional: true
  has_many :allotments, dependent: :destroy
end
