class ClientesController < AdminController
  before_action :set_cliente, only: %i[ show edit update destroy veiculos ]

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)
    handle_save(@cliente.save, :new, "Cliente cadastrado com sucesso.")
    if create_user_for_cliente
      ClienteMailer.conta_criada(@cliente).deliver_later
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    handle_save(@cliente.update(cliente_params), :edit, "Cliente editado com sucesso.")
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente.destroy!

    respond_to do |format|
      format.html { redirect_to clientes_url, notice: "Cliente excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  def veiculos
    render json: @cliente.veiculos.select(:id, :modelo, :placa)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cliente
    @cliente = Cliente.find_by(id: params[:id])
    unless @cliente
      redirect_to clientes_path, notice: "Cliente não encontrado."
    end
  end

  # Only allow a list of trusted parameters through.
  def cliente_params
    params.require(:cliente).permit(:nome, :email, :telefone, :cpf, :endereco)
  end

  def create_user_for_cliente
    user = User.new(
      email: @cliente.email,
      password: @cliente.cpf.gsub(/\D/, ''),
      cliente_id: @cliente.id
    )
    user.save
  end

  def handle_save(method_success, render_template, notice_message)
    respond_to do |format|
      if method_success
        format.html { redirect_to cliente_url(@cliente), notice: notice_message }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render render_template, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end
end
