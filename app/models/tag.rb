class Tag < ApplicationRecord

  validates :name, length: { minimum: 2 }

  belongs_to :project

end
