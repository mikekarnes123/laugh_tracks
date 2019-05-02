class AddImageurlToSpecial < ActiveRecord::Migration[5.1]
  def change
    add_column :specials, :image_url, :string
  end
end
