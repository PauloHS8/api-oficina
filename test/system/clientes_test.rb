require "application_system_test_case"

class ClientesTest < ApplicationSystemTestCase
  setup do
    @cliente = clientes(:one)
  end

  test "visiting the index" do
    visit clientes_url
    assert_selector "h1", text: "Clientes"
  end

  test "should create cliente" do
    visit clientes_url
    click_on "Novo cliente"

    fill_in "Cpf", with: @cliente.cpf
    fill_in "Email", with: @cliente.email
    fill_in "Endereco", with: @cliente.endereco
    fill_in "Nome", with: @cliente.nome
    fill_in "Telefone", with: @cliente.telefone
    click_on "Create Cliente"

    assert_text "Cliente cadastrado com sucesso"
    click_on "Back"
  end

  test "should update Cliente" do
    visit cliente_url(@cliente)
    click_on "Editar cliente", match: :first

    fill_in "Cpf", with: @cliente.cpf
    fill_in "Email", with: @cliente.email
    fill_in "Endereco", with: @cliente.endereco
    fill_in "Nome", with: @cliente.nome
    fill_in "Telefone", with: @cliente.telefone
    click_on "Update Cliente"

    assert_text "Cliente editado com sucesso"
    click_on "Back"
  end

  test "should destroy Cliente" do
    visit cliente_url(@cliente)
    click_on "Excluir cliente", match: :first

    assert_text "Cliente excluído com sucesso"
  end
end
