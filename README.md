# GS-IOT

## 📌 Descrição
O projeto **GS-IOT** tem como objetivo a implementação de um sistema IoT baseado no ESP32, permitindo a coleta, armazenamento e análise de dados de sensores. A comunicação entre dispositivos é feita utilizando o protocolo MQTT, possibilitando o monitoramento remoto em tempo real.

## 🛠️ Tecnologias Utilizadas
- **ESP32**: Microcontrolador para a execução do firmware.
- **Arduino IDE**: Ambiente de desenvolvimento para programação do ESP32.
- **MQTT**: Protocolo de comunicação entre dispositivos.
- **Banco de Dados**: Armazena as leituras dos sensores.
- **Dashboard Web**: Interface para visualização dos dados em tempo real.

## 🚀 Funcionalidades
- Leitura de sensores de temperatura, umidade e luminosidade.
- Publicação de dados via MQTT.
- Monitoramento remoto dos sensores.
- Controle de atuadores a partir da interface web.
- Armazenamento e histórico de leituras.

## 🔧 Como Configurar
1. Clone este repositório:
   ```bash
   git clone https://github.com/Bernas01/GS-IOT.git
   ```
2. Instale a **Arduino IDE** e configure a placa ESP32.
3. Instale as bibliotecas necessárias para MQTT e sensores.
4. Configure o broker MQTT e o banco de dados.
5. Carregue o firmware no ESP32.
6. Inicie o dashboard web para acompanhar os dados.

## 📂 Estrutura do Projeto
```
/
├── firmware/        # Código do ESP32
├── dashboard/       # Interface web
├── database/        # Scripts do banco de dados
├── docs/            # Documentação
└── README.md        # Este arquivo
```

## 🤝 Contribuição
Sinta-se à vontade para contribuir!
1. Fork este repositório.
2. Crie um branch para sua funcionalidade: `git checkout -b minha-feature`.
3. Commit suas alterações: `git commit -m 'Adicionando nova funcionalidade'`.
4. Envie para o repositório remoto: `git push origin minha-feature`.
5. Abra um Pull Request.

## 👤 Autor
Projeto desenvolvido por **Felipe Bernardes de Almeida**.

## 📜 Licença
Este projeto está licenciado sob a [MIT License](LICENSE).
