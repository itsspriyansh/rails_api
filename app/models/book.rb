class Book < ApplicationRecord
  validates :title, presence: true,  length: {minimum:3, maximum:300}

  belongs_to :author
end
