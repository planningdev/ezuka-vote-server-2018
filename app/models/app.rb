class App < Product

  has_many :images, as: :imageable

  accepts_nested_attributes_for :images, allow_destroy: true


  def to_param
    encrypted_id
  end
end