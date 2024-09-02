document.addEventListener("turbo:load", () => {
    function setupClienteVeiculoSelect(formName) {
        const clienteSelect = document.querySelector(`select[name='${formName}[cliente_id]']`);
        const veiculoSelect = document.querySelector("#veiculo_select");

        if (clienteSelect && veiculoSelect) {
            clienteSelect.addEventListener("change", (event) => {
                const clienteId = event.target.value;

                if (clienteId) {
                    fetch(`/clientes/${clienteId}/veiculos`)
                        .then(response => response.json())
                        .then(veiculos => {
                            veiculoSelect.innerHTML = '<option value="">Selecione um veículo</option>';
                            veiculos.forEach(veiculo => {
                                const option = document.createElement("option");
                                option.value = veiculo.id;
                                option.textContent = `${veiculo.placa} - ${veiculo.modelo}`;
                                veiculoSelect.appendChild(option);
                            });
                        });
                } else {
                    veiculoSelect.innerHTML = '<option value="">Selecione um veículo</option>';
                }
            });
        }
    }

    setupClienteVeiculoSelect('atendimento');
    setupClienteVeiculoSelect('venda_servico');
});
