class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :text

      t.references :post

      t.timestamps
    end
  end
end
