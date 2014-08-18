class CreateContactus < ActiveRecord::Migration
  def change
    create_table :contactus do |t|
      t.string :name
      t.string :email
      t.text :message
      t.string :subject

      t.timestamps
    end
  end
end
