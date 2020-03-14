class DeviseCreateUsers < ActiveRecord::Migration[6.0]
	def change
		create_table :users do |t|
			t.string :email,              null: false, default: ""
			t.string :encrypted_password, null: false, default: ""
			t.string :name
			t.string :MobileNo
			t.string :gender, default: "Male"
			t.string   :reset_password_token
			t.datetime :reset_password_sent_at
			t.datetime :remember_created_at
			t.boolean :status, default: false
			t.string   :unconfirmed_email
			t.datetime :confirmation_sent_at
			t.datetime :confirmed_at
			t.string   :confirmation_token
			t.integer  :failed_attempts
			t.string   :unlock_token
			t.datetime :locked_at
			t.timestamps null: false
		end
		add_index :users, :email,                unique: true
		add_index :users, :reset_password_token, unique: true
	end
end
