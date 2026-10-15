USE detran_desafio;

-- A) Apresentar todos os dados dos veículos de um determinado proprietário (informado pelo usuário através do CPF)
-- Neste exemplo, usamos o CPF '11111111111' do João Silva (que tem 2 carros)
SELECT * 
FROM Veiculo 
WHERE cpf_proprietario = '11111111111';

-- B) Consultar proprietário(s) por qualquer parte do nome
-- O comando LIKE '%...' permite procurar qualquer pessoa que tenha "Silva" no nome
SELECT * 
FROM Proprietario 
WHERE nome LIKE '%Silva%';

-- C) Mostrar os dados da infração e do veículo que tiveram infrações cadastradas no Detran em um período (DE... ATÉ...)
-- Usamos o JOIN para juntar as duas tabelas e o BETWEEN para definir o intervalo de datas (ex: Janeiro a Março de 2024)
SELECT i.id_infracao, i.data_hora, i.velocidade_aferida, v.placa, v.cor, v.ano_fabricacao
FROM Infracao i
JOIN Veiculo v ON i.placa_veiculo = v.placa
WHERE i.data_hora BETWEEN '2024-01-01 00:00:00' AND '2024-03-31 23:59:59';

-- D) Pesquisar o número de veículos que foram cadastrados em cada modelo, ordenando pelo número de veículos em ordem decrescente
-- Usamos o COUNT para contar os carros, agrupamos (GROUP BY) pelo modelo e ordenamos do maior para o menor (DESC)
SELECT m.descricao AS nome_modelo, COUNT(v.placa) AS total_veiculos
FROM Modelo m
LEFT JOIN Veiculo v ON m.codigo_modelo = v.codigo_modelo
GROUP BY m.codigo_modelo, m.descricao
ORDER BY total_veiculos DESC;