require "application_system_test_case"

class EstoquesTest < ApplicationSystemTestCase
  setup do
    @estoque = estoques(:one)
  end

  test "visiting the index" do
    visit estoques_url
    assert_selector "h1", text: "Estoques"
  end

  test "should create estoque" do
    visit estoques_url
    click_on "Novo estoque"

    fill_in "Codigo", with: @estoque.codigo
    fill_in "Quantidade", with: @estoque.quantidade
    click_on "Create Estoque"

    assert_text "Estoque cadastrado com sucesso"
    click_on "Back"
  end

  test "should update Estoque" do
    visit estoque_url(@estoque)
    click_on "Editar estoque", match: :first

    fill_in "Codigo", with: @estoque.codigo
    fill_in "Quantidade", with: @estoque.quantidade
    click_on "Update Estoque"

    assert_text "Estoque editado com sucesso"
    click_on "Back"
  end

  test "should destroy Estoque" do
    visit estoque_url(@estoque)
    click_on "Excluir estoque", match: :first

    assert_text "Estoque excluído com sucesso"
  end
end
