require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @admin = users(:admin)
    @cliente = users(:cliente)
  end

  test "deve ser válido com dados corretos" do
    assert @admin.valid?
    assert @cliente.valid?
  end

  test "deve ser inválido sem email" do
    @admin.email = nil
    assert_not @admin.valid?
    assert_includes @admin.errors[:email], "não pode ficar em branco"
  end

  test "deve ser inválido sem senha" do
    user = User.new(email: 'invalid@example.com', password: '', password_confirmation: '')
    assert_not user.valid?
    assert_includes user.errors[:password], "não pode ficar em branco"
  end

  test "deve ter role padrão como cliente" do
    user = User.new(email: 'test@example.com', encrypted_password: Devise::Encryptor.digest(User, '123456'))
    assert_equal 'cliente', user.role
  end

  test "deve permitir definir role como admin" do
    @admin.role = :admin
    assert @admin.valid?
    assert_equal 'admin', @admin.role
  end

  test "deve criar um admin com dados corretos" do
    assert_difference 'User.count', 1 do
      User.create!(
        email: 'newadmin@admin.com',
        password: '123456',
        password_confirmation: '123456',
        role: :admin
      )
    end
  end

  test "deve criar um cliente com dados corretos" do
    assert_difference 'User.count', 1 do
      User.create!(
        email: 'newcliente@cliente.com',
        password: '123456',
        password_confirmation: '123456',
        role: :cliente
      )
    end
  end
end
