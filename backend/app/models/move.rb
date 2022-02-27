# frozen_string_literal: true

class Move < ApplicationRecord
  belongs_to :player

  validates :cell, presence: true, in: 1..9
end
