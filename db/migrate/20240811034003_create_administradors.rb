class CreateAdministradors < ActiveRecord::Migration[7.2]
  def change
    create_table :administradors do |t|
      t.string :email
      t.string :senha

      t.timestamps
    end
  end
end
