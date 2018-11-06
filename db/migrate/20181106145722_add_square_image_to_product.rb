class AddSquareImageToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :square_image, :string, default: ""
  end
end
