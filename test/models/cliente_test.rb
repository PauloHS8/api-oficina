require "test_helper"

class ClienteTest < ActiveSupport::TestCase
  setup do
    @cliente = clientes(:one)
  end

  test "cliente deve ser válido" do
    assert @cliente.valid?
  end

  test "deve ser inválido sem nome" do
    @cliente.nome = nil
    assert_not @cliente.save
    assert_not_empty @cliente.errors[:nome]
  end

  test "deve ser inválido sem email" do
    @cliente.email = nil
    assert_not @cliente.save
    assert_not_empty @cliente.errors[:email]
  end

  test "deve ser inválido sem telefone" do
    @cliente.telefone = nil
    assert_not @cliente.save
    assert_not_empty @cliente.errors[:telefone]
  end

  test "deve ser inválido sem CPF" do
    @cliente.cpf = nil
    assert_not @cliente.save
    assert_not_empty @cliente.errors[:cpf]
  end

  test "deve ser inválido sem endereco" do
    @cliente.endereco = nil
    assert_not @cliente.save
    assert_not_empty @cliente.errors[:endereco]
  end

  test "email deve ser único" do
    @cliente.save
    clienteEmailDuplicado = Cliente.new({
      nome: "Maria",
      email: @cliente.email,
      telefone: "87999004466",
      cpf: "01223334444",
      endereco: "Rua A"
    })

    assert_not clienteEmailDuplicado.save
    assert_includes clienteEmailDuplicado.errors[:email], "já está em uso"
  end

  test "CPF deve ser único" do
    @cliente.save
    clienteCpfDuplicado = Cliente.new({
      nome: "Mari",
      email: "mari@gmail.com",
      telefone: "87999004466",
      cpf: @cliente.cpf,
      endereco: "Rua A"
    })

    assert_not clienteCpfDuplicado.save
    assert_includes clienteCpfDuplicado.errors[:cpf], "já está em uso"
  end
end
