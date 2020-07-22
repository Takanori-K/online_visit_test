class AddSecretWordToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :secret_word, :string
  end
end
