require "test_helper"

class PecasFlowTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
    @peca = pecas(:one)
  end

  test "should get index" do
    get pecas_url
    assert_response :success
    assert_select "h1", "Peças"
    assert_select "table"
    assert_select "a", text: "Nova peça"
  end

  test "should show peca" do
    get peca_url(@peca)
    assert_response :success
    assert_select "p", text: /Código:\s*#{@peca.codigo}/
    assert_select "p", text: /Nome:\s*#{@peca.nome}/
    assert_select "p", text: /Preço:\s*#{@peca.preco}/
    assert_select "p", text: /Tipo:\s*#{@peca.tipo}/
    assert_select "p", text: /Fabricante:\s*#{@peca.fabricante}/
    assert_select "p", text: /Data de validade:\s*#{@peca.data_validade.strftime("%Y-%m-%d")}/
    assert_select "a", text: "Editar peça"
    assert_select "button", text: "Excluir peça"
  end

  test "should get edit" do
    get edit_peca_url(@peca)
    assert_response :success
    assert_select "h1", "Editar peça"
    assert_select "form"
  end

  test "should get new" do
    get new_peca_url
    assert_response :success
    assert_select "h1", "Novo peça"
    assert_select "form"
  end

  test "should create peca" do
    assert_difference('Peca.count') do
      post pecas_url, params: { peca: { codigo: '1234', nome: 'Peça Teste', preco: 99.99, tipo: 'Tipo A', fabricante: 'Fabricante Teste', data_validade: '2025-12-31' } }
    end
    assert_redirected_to peca_url(Peca.last)
  end

  test "should update peca" do
    patch peca_url(@peca), params: { peca: { nome: 'Nome Atualizado' } }
    assert_redirected_to peca_url(@peca)
    @peca.reload
    assert_equal 'Nome Atualizado', @peca.nome
  end

  test "should destroy peca" do
    assert_difference('Peca.count', -1) do
      delete peca_url(@peca)
    end
    assert_redirected_to pecas_url
  end
end