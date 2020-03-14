class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :website
      t.string :mobileno
      t.string :slug
      t.timestamps
    end
  end
end
