# test/models/estoque_test.rb
require "test_helper"

class EstoqueTest < ActiveSupport::TestCase
  test "não deve salvar estoque sem código" do
    estoque = Estoque.new(quantidade: 1)
    assert_not estoque.save, "O estoque não deve ser salvo sem um código."
    assert_includes estoque.errors.messages[:codigo], "não pode ficar em branco"
  end

  test "não deve salvar estoque sem quantidade" do
    estoque = Estoque.new(codigo: "MeuCodigo")
    assert_not estoque.save, "O estoque não deve ser salvo sem uma quantidade."
    assert_includes estoque.errors.messages[:quantidade], "não pode ficar em branco"
  end

  test "deve salvar estoque válido" do
    estoque = Estoque.new(codigo: "MeuCodigo", quantidade: 1)
    assert estoque.save, "O estoque válido não foi salvo."
  end

  test "não deve salvar estoque sem código e quantidade" do
    estoque = Estoque.new
    assert_not estoque.save, "O estoque não deve ser salvo sem código e quantidade."
    assert_includes estoque.errors.messages[:codigo], "não pode ficar em branco"
    assert_includes estoque.errors.messages[:quantidade], "não pode ficar em branco"
  end

  test "deve associar com peças e salvar" do
    estoque = estoques(:one)
    peca = pecas(:one)
    estoque.pecas << peca
    assert_includes estoque.pecas, peca, "O estoque deve estar associado à peça."
    assert estoque.save
  end
end
