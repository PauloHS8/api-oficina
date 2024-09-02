require "test_helper"

class EstoquesFlowTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
    @estoque = estoques(:one)
    @peca = pecas(:one)
  end


  test "should get new estoque" do
    get new_estoque_url
    assert_response :success

    assert_select "h1", "Novo estoque"
    assert_select "form" do
      assert_select "input[name='estoque[codigo]']"
      assert_select "input[name='estoque[quantidade]']"
    end
  end

  test "should create estoque" do
    assert_difference('Estoque.count') do
      post estoques_url, params: { estoque: { codigo: "E1234", quantidade: 50, peca_id: @peca.id } }
    end

    assert_redirected_to estoque_url(Estoque.last)
    follow_redirect!

    assert_select "title", text: "Detalhes do estoque"
    assert_select "p", text: /Codigo:\s*E1234/
    assert_select "p", text: /Quantidade:\s*50/
  end

  test "should show estoque" do
    get estoque_url(@estoque)
    assert_response :success

    assert_select "p", text: /Codigo:\s*#{@estoque.codigo}/
    assert_select "p", text: /Quantidade:\s*#{@estoque.quantidade}/
    assert_select "a", text: "Editar estoque"
    assert_select "button", text: "Excluir estoque"
  end

  test "should get edit estoque" do
    get edit_estoque_url(@estoque)
    assert_response :success

    assert_select "h1", "Editar estoque"
    assert_select "form" do
      assert_select "input[name='estoque[codigo]']"
      assert_select "input[name='estoque[quantidade]']"
    end
  end

  test "should update estoque" do
    patch estoque_url(@estoque), params: { estoque: { codigo: "E5678", quantidade: 75 } }
    assert_redirected_to estoque_url(@estoque)
    follow_redirect!
    assert_select "p", text: /Codigo:\s*E5678/
    assert_select "p", text: /Quantidade:\s*75/
  end

  test "should destroy estoque" do
    assert_difference('Estoque.count', -1) do
      delete estoque_url(@estoque)
    end

    assert_redirected_to estoques_url
    follow_redirect!

    assert_select "p", text: /Estoque excluído com sucesso./
  end
end
