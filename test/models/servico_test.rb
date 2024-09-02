require "test_helper"

class ServicoTest < ActiveSupport::TestCase
  setup do
    @servico = servicos(:one)
  end

  test "deve ser válido" do
    assert @servico.valid?, "Erro: #{@servico.errors.full_messages.join(', ')}"
  end

  test "codigo deve estar presente" do
    @servico.codigo = "   "
    assert_not @servico.save
    assert_includes @servico.errors[:codigo], "não pode ficar em branco"
  end

  test "nome deve estar presente" do
    @servico.nome = "   "
    assert_not @servico.save
    assert_includes @servico.errors[:nome], "não pode ficar em branco"
  end

  test "descricao deve estar presente" do
    @servico.descricao = "   "
    assert_not @servico.save
    assert_includes @servico.errors[:descricao], "não pode ficar em branco"
  end

  test "descricao não deve ser maior que 100 caracteres" do
    @servico.descricao = "a" * 101
    assert_not @servico.save
    assert_includes @servico.errors[:descricao], "é muito longo (máximo: 100 caracteres)"
  end

  test "preco deve estar presente" do
    @servico.preco = nil
    assert_not @servico.save
    assert_includes @servico.errors[:preco], "não pode ficar em branco"
  end

  test "preco deve ser maior ou igual a 0" do
    @servico.preco = -1
    assert_not @servico.save
    assert_includes @servico.errors[:preco], "deve ser maior ou igual a 0"
  end

  test "associação com atendimentos" do
    assert_respond_to @servico, :atendimentos
  end
end
