class AddClienteIdToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :cliente_id, :integer
    add_index :users, :cliente_id
  end
end
