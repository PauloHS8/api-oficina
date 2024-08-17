require "application_system_test_case"

class ServicosTest < ApplicationSystemTestCase
  setup do
    @servico = servicos(:one)
  end

  test "visiting the index" do
    visit servicos_url
    assert_selector "h1", text: "Servicos"
  end

  test "should create servico" do
    visit servicos_url
    click_on "Novo servico"

    fill_in "Codigo", with: @servico.codigo
    fill_in "Descricao", with: @servico.descricao
    fill_in "Nome", with: @servico.nome
    fill_in "Preco", with: @servico.preco
    click_on "Create Servico"

    assert_text "Servico cadastrado com sucesso"
    click_on "Back"
  end

  test "should update Servico" do
    visit servico_url(@servico)
    click_on "Editar servico", match: :first

    fill_in "Codigo", with: @servico.codigo
    fill_in "Descricao", with: @servico.descricao
    fill_in "Nome", with: @servico.nome
    fill_in "Preco", with: @servico.preco
    click_on "Update Servico"

    assert_text "Servico editado com sucesso"
    click_on "Back"
  end

  test "should destroy Servico" do
    visit servico_url(@servico)
    click_on "Excluir servico", match: :first

    assert_text "Servico excluído com sucesso"
  end
end
