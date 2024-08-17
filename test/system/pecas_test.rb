require "application_system_test_case"

class PecasTest < ApplicationSystemTestCase
  setup do
    @peca = pecas(:one)
  end

  test "visiting the index" do
    visit pecas_url
    assert_selector "h1", text: "Pecas"
  end

  test "should create peca" do
    visit pecas_url
    click_on "Nova peça"

    fill_in "Codigo", with: @peca.codigo
    fill_in "Data validade", with: @peca.data_validade
    fill_in "Fabricante", with: @peca.fabricante
    fill_in "Nome", with: @peca.nome
    fill_in "Preco", with: @peca.preco
    fill_in "Tipo", with: @peca.tipo
    click_on "Create Peca"

    assert_text "Peça cadastrada com sucesso"
    click_on "Back"
  end

  test "should update Peca" do
    visit peca_url(@peca)
    click_on "Editar peça", match: :first

    fill_in "Codigo", with: @peca.codigo
    fill_in "Data validade", with: @peca.data_validade
    fill_in "Fabricante", with: @peca.fabricante
    fill_in "Nome", with: @peca.nome
    fill_in "Preco", with: @peca.preco
    fill_in "Tipo", with: @peca.tipo
    click_on "Update Peca"

    assert_text "Peça atualizada com sucesso"
    click_on "Back"
  end

  test "should destroy Peca" do
    visit peca_url(@peca)
    click_on "Excluir peça", match: :first

    assert_text "Peça excluída com sucesso"
  end
end
