class CreateEstoques < ActiveRecord::Migration[7.2]
  def change
    create_table :estoques do |t|
      t.string :codigo
      t.integer :quantidade

      t.timestamps
    end
  end
end
