require "test_helper"

class PecaTest < ActiveSupport::TestCase
  setup do
    @peca = pecas(:one)
  end

  test "deve ser peça válida" do
    assert @peca.valid?
  end

  test "não deve ser válido sem código" do
    @peca.codigo = nil
    assert_not @peca.save
    assert_includes @peca.errors[:codigo], "não pode ficar em branco"
  end

  test "não deve ser válido com código duplicado" do
    peca_duplicada = @peca.dup
    @peca.save
    assert_not peca_duplicada.save
    assert_includes peca_duplicada.errors[:codigo], "já está em uso"
  end

  test "não deve ser válido sem nome" do
    @peca.nome = nil
    assert_not @peca.save
    assert_includes @peca.errors[:nome], "não pode ficar em branco"
  end

  test "não deve ser válido com nome muito curto" do
    @peca.nome = "A"
    assert_not @peca.save
    assert_includes @peca.errors[:nome], "é muito curto (mínimo: 2 caracteres)"
  end

  test "não deve ser válido com nome muito longo" do
    @peca.nome = "A" * 21
    assert_not @peca.save
    assert_includes @peca.errors[:nome], "é muito longo (máximo: 20 caracteres)"
  end

  test "não deve ser válido sem preço" do
    @peca.preco = nil
    assert_not @peca.save
    assert_includes @peca.errors[:preco], "não pode ficar em branco"
  end

  test "não deve ser válido sem tipo" do
    @peca.tipo = nil
    assert_not @peca.save
    assert_includes @peca.errors[:tipo], "não pode ficar em branco"
  end

  test "não deve ser válido sem fabricante" do
    @peca.fabricante = nil
    assert_not @peca.save
    assert_includes @peca.errors[:fabricante], "não pode ficar em branco"
  end

  test "não deve ser válido sem data de validade" do
    @peca.data_validade = nil
    assert_not @peca.save
    assert_includes @peca.errors[:data_validade], "não pode ficar em branco"
  end
end
