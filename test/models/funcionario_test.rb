require "test_helper"

class FuncionarioTest < ActiveSupport::TestCase
  setup do
    @funcionario = funcionarios(:one)
  end

  test "deve ser válido com atributos válidos" do
    assert @funcionario.valid?
  end

  test "não deve ser válido sem matrícula" do
    @funcionario.matricula = nil
    assert_not @funcionario.save
    assert_includes @funcionario.errors[:matricula], "não pode ficar em branco"
  end

  test "não deve ser válido sem nome" do
    @funcionario.nome = nil
    assert_not @funcionario.save
    assert_includes @funcionario.errors[:nome], "não pode ficar em branco"
  end

  test "não deve ser válido com nome muito curto" do
    @funcionario.nome = "Jo"
    assert_not @funcionario.save
    assert_includes @funcionario.errors[:nome], "é muito curto (mínimo: 3 caracteres)"
  end

  test "não deve ser válido sem cargo" do
    @funcionario.cargo = nil
    assert_not @funcionario.save
    assert_includes @funcionario.errors[:cargo], "não pode ficar em branco"
  end

  test "não deve ser válido sem email" do
    @funcionario.email = nil
    assert_not @funcionario.save
    assert_includes @funcionario.errors[:email], "não pode ficar em branco"
  end

  test "não deve ser válido sem salário" do
    @funcionario.salario = nil
    assert_not @funcionario.save
    assert_includes @funcionario.errors[:salario], "não pode ficar em branco"
  end

  test "não deve ser válido sem data de admissão" do
    @funcionario.data_admissao = nil
    assert_not @funcionario.save
    assert_includes @funcionario.errors[:data_admissao], "não pode ficar em branco"
  end

  test "não deve ser válido sem CPF" do
    @funcionario.cpf = nil
    assert_not @funcionario.save
    assert_includes @funcionario.errors[:cpf], "não pode ficar em branco"
  end

  test "não deve ser válido com tamanho de CPF incorreto" do
    @funcionario.cpf = "1234567890"  # CPF com 10 dígitos, inválido
    assert_not @funcionario.save
    assert_includes @funcionario.errors[:cpf], "é muito curto (mínimo: 11 caracteres)"
  end
end
