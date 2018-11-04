class App < Product
  has_many :images, as: :imageable
end