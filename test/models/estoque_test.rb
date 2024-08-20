# test/models/estoque_test.rb
require "test_helper"

class EstoqueTest < ActiveSupport::TestCase
  test "should not save estoque without codigo" do
    estoque = Estoque.new(quantidade: 1)
    assert_not estoque.save, "Saved the estoque without a codigo"
  end

  test "should not save estoque without quantidade" do
    estoque = Estoque.new(codigo: "MyString")
    assert_not estoque.save, "Saved the estoque without a quantidade"
  end

  test "should save valid estoque" do
    estoque = Estoque.new(codigo: "MyString", quantidade: 1)
    assert estoque.save, "Could not save a valid estoque"
  end


  test "should not save estoque without codigo and quantidade" do
    estoque = Estoque.new
    assert_not estoque.save, "Saved the estoque without codigo and quantidade"
  end

  test "should associate with pecas" do
    estoque = estoques(:one)
    peca = pecas(:one)
    estoque.pecas << peca
    assert_includes estoque.pecas, peca, "Estoque should be associated with peca"
  end

end
