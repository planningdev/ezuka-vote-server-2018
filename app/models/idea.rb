class Idea < Product
  has_many :images, as: :imageable
end