class FuncionariosController < AdminController
  before_action :set_funcionario, only: %i[ show edit update destroy ]

  # GET /funcionarios or /funcionarios.json
  def index
    @funcionarios = Funcionario.all
  end

  # GET /funcionarios/1 or /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios or /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)
    handle_save(@funcionario.save, :new, "Funcionário cadastrado com sucesso.")
  end

  # PATCH/PUT /funcionarios/1 or /funcionarios/1.json
  def update
    handle_save(@funcionario.update(funcionario_params), :edit, "Funcionário editado com sucesso.")
  end

  # DELETE /funcionarios/1 or /funcionarios/1.json
  def destroy
    @funcionario.destroy!

    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: "Funcionario excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_funcionario
    @funcionario = Funcionario.find_by(id: params[:id])
    if @funcionario.nil?
      redirect_to funcionarios_path, notice: "Funcionário não encontrado."
    end
  end

  # Only allow a list of trusted parameters through.
  def funcionario_params
    params.require(:funcionario).permit(:matricula, :nome, :cargo, :email, :salario, :data_admissao, :cpf)
  end

  def handle_save(method_success, render_template, notice_message)
    respond_to do |format|
      if method_success
        format.html { redirect_to funcionario_url(@funcionario), notice: notice_message }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render render_template, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end
end