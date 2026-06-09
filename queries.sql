USE locadoraveiculos;

-- Verificação rápida das tabelas principais
SELECT * FROM Cliente;
SELECT * FROM Pagamento;
SELECT * FROM Locacao;
SELECT * FROM Veiculo;
SELECT * FROM Manutencao;
SELECT * FROM LocacaoVeiculo;

-- Relatório 1: Detalhes de descrições e custos das manutenções
SELECT descricao, dataManutencao, custo FROM Manutencao;

-- Relatório 2: Total arrecadado considerando apenas pagamentos já efetuados
SELECT SUM(valorTotal) AS total_arrecadado FROM Pagamento WHERE estado = 'Pago';

-- Relatório 3: Ranking dos veículos mais alugados (do mais alugado para o menos alugado)
SELECT v.modelo, v.marca, COUNT(lv.idLocacao) AS total_locacoes 
FROM Veiculo v 
JOIN LocacaoVeiculo lv ON v.idVeiculo = lv.idVeiculo 
GROUP BY v.idVeiculo, v.modelo, v.marca 
ORDER BY total_locacoes DESC; 

-- Relatório 4: Lista de clientes inadimplentes (com pagamentos pendentes) e o valor total devido
SELECT c.nome, SUM(p.valorTotal) AS valor_devido 
FROM Cliente c 
JOIN Locacao l ON c.idCliente = l.idCliente 
JOIN Pagamento p ON l.idPagamento = p.idPagamento 
WHERE p.estado = 'Pendente' 
GROUP BY c.idCliente, c.nome 
ORDER BY c.nome ASC;