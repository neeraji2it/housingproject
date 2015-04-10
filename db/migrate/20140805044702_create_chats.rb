class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.timestamps
    end
  end
end