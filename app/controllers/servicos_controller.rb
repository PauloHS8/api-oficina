class ServicosController < AdminController
  before_action :set_servico, only: %i[ show edit update destroy ]

  # GET /servicos or /servicos.json
  def index
    @servicos = Servico.all
  end

  # GET /servicos/1 or /servicos/1.json
  def show
  end

  # GET /servicos/new
  def new
    @servico = Servico.new
  end

  # GET /servicos/1/edit
  def edit
  end

  # POST /servicos or /servicos.json
  def create
    @servico = Servico.new(servico_params)
    handle_save(@servico.save, :new, "Serviço cadastrado com sucesso.")
  end

  # PATCH/PUT /servicos/1 or /servicos/1.json
  def update
    handle_save(@servico.update(servico_params), :edit, "Serviço editado com sucesso.")
  end

  # DELETE /servicos/1 or /servicos/1.json
  def destroy
    @servico.destroy!
    respond_to do |format|
      format.html { redirect_to servicos_url, notice: "Servico excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_servico
    @servico = Servico.find_by(id: params[:id])
    if @servico.nil?
      redirect_to servicos_path, notice: "Serviço não encontrado."
    end
  end

  # Only allow a list of trusted parameters through.
  def servico_params
    params.require(:servico).permit(:codigo, :nome, :descricao, :preco)
  end

  def handle_save(method_success, render_template, notice_message)
    respond_to do |format|
      if method_success
        format.html { redirect_to servico_url(@servico), notice: notice_message }
        format.json { render :show, status: :ok, location: @servico }
      else
        format.html { render render_template, status: :unprocessable_entity }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end
end
