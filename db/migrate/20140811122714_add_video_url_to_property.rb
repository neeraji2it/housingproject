class AddVideoUrlToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :video_url, :string
  end
end
