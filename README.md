# Sistema de Banco de Dados Relacional - Locadora de Veículos 

Este repositório contém o modelo físico, povoamento e scripts de consulta SQL desenvolvidos por mim para uma atividade acadêmica de Banco de Dados Relacional na Uninter.

O objetivo do projeto foi projetar e implementar um banco de dados robusto capaz de gerenciar os processos de negócio de uma locadora de automóveis, cobrindo o cadastro de clientes, controle de frotas, histórico de manutenções, fluxo de locações e controle financeiro de pagamentos.

---

## Estrutura do Banco de Dados (Modelo Entidade-Relacionamento)
O ecossistema do banco é composto por 6 tabelas interconectadas:
* **Cliente**: Dados cadastrais dos locatários (`CPF`, nome, telefone, etc.).
* **Veiculo**: Controle da frota disponível, guardando valores de diárias e o estado atual do automóvel.
* **Pagamento**: Registro financeiro das transações com suporte a múltiplos métodos (`Cartão`, `Pix`, `Dinheiro`) e controle de status (`Pago`, `Pendente`).
* **Locacao**: Tabela que vincula o cliente ao período contratado e ao respectivo registro financeiro.
* **Manutencao**: Histórico de reparos dos veículos para controle de depreciação e custos operacionais.
* **LocacaoVeiculo**: Tabela relacional associativa (N:M) que permite vincular múltiplos veículos a um mesmo contrato de locação.

---

## Tecnologias Utilizadas
* **SGBD:** MySQL 
* **Linguagem:** SQL (Structured Query Language)

---

## Organização dos Scripts
* `schema.sql`: Definição da estrutura do banco de dados, chaves primárias (`PK`), estrangeiras (`FK`) e restrições.
* `data.sql`: Scripts de inserção de dados fictícios para testes de volumetria e queries.
* `queries.sql`: Consultas analíticas e relatórios estratégicos estruturados para responder perguntas de negócio.

### Exemplos de Relatórios Inclusos:
1. **Faturamento Realizado**: Consolidação de valores transacionados e liquidados.
2. **Ranking de Locações por Veículo**: Métrica para identificar a rotatividade e preferência de modelos da frota utilizando `COUNT` e `JOIN`.
3. **Relatório de Inadimplência**: Listagem nominal de clientes com débitos pendentes utilizando agregações com `SUM`.

---

##  Como Executar o Projeto

1. Abra gerenciador de banco de dados de sua preferência.
2. Execute o script `schema.sql` para erguer a infraestrutura de tabelas.
3. Popule a base executando o script `data.sql`.
4. Teste os relatórios analíticos utilizando o arquivo `queries.sql`.
