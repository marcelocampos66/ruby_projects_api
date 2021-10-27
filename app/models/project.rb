class Project < ApplicationRecord

  validates :name, length: { minimum: 6 }, uniqueness: true
  validates :language, length: { minimum: 2 }
  validates :framework, length: { minimum: 2 }
  validates :description, length: { minimum: 6 }

  has_many :tags

end
