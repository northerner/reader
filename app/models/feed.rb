class Feed < ApplicationRecord
  has_many :entries, -> { order(:published_at) }, dependent: :destroy

  scope :tagged, -> (tag){ where('? = ANY (tags)', tag) }
end
