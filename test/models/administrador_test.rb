require "test_helper"

class AdministradorTest < ActiveSupport::TestCase
  setup do
    @admin = administradors(:one)
  end

  test "administrador deve ser válido" do
    assert @admin.valid?
  end

  test "deve ser inválido sem email" do
    @admin.email = nil
    assert_not @admin.save
    assert_includes @admin.errors[:email], "não pode ficar em branco"
  end

  test "email deve ser único" do
    adminEmailDuplicado = @admin.dup
    adminEmailDuplicado.email = @admin.email.upcase
    assert_not adminEmailDuplicado.save
    assert_includes adminEmailDuplicado.errors[:email], "já está em uso"
  end

  test "deve ser inválido sem senha" do
    @admin.senha = nil
    assert_not @admin.save
    assert_includes @admin.errors[:senha], "não pode ficar em branco"
  end

  test "senha deve ter pelo menos 6 caracteres" do
    @admin.senha = "12345"
    assert_not @admin.save
    assert_includes @admin.errors[:senha], "é muito curto (mínimo: 6 caracteres)"
  end
end