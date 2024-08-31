class CreateAdminUser < ActiveRecord::Migration[7.2]
  def up
    User.create!(email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'], role: :admin)
  end

  def down
    User.find_by(email: ENV['ADMIN_EMAIL'])&.destroy
  end
end
