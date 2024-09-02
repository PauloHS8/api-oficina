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
    peca = pecas(:one)
    estoque = Estoque.new(codigo: "MeuCodigo", quantidade: 1, peca: peca)
    assert estoque.save, "O estoque válido não foi salvo. Erros: #{estoque.errors.full_messages.join(', ')}"
  end

  test "não deve salvar estoque sem código e quantidade" do
    estoque = Estoque.new
    assert_not estoque.save, "O estoque não deve ser salvo sem código e quantidade."
    assert_includes estoque.errors.messages[:codigo], "não pode ficar em branco"
    assert_includes estoque.errors.messages[:quantidade], "não pode ficar em branco"
  end

  test "deve associar com peça e salvar" do
    peca = pecas(:one)
    estoque = Estoque.new(codigo: "MeuCodigo", quantidade: 1, peca: peca)
    assert estoque.save, "O estoque válido não foi salvo. Erros: #{estoque.errors.full_messages.join(', ')}"
    assert_equal peca, estoque.peca, "O estoque deve estar associado à peça."
  end
end
