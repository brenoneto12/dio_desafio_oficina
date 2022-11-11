use oficina;

insert into cliente (nome, endereco, telefone, CPF) values ("José Francisco", "Rua 5", "999369552", "01234567811"),
														   ("Antônia Maria", "Rua 1", "999886655", "78945612322"),
                                                           ("Larissa Freitas", "Rua 3", "988523647", "98765432100"),
														   ("Raimundo Nonato", "Rua 5", "981035564", "00123456789"),
														   ("Mariazinha", "Rua 6", "988315558", "99987654321");

select * from cliente;


insert into veiculo (idCliente, marca, modelo, cor, ano, km) values (1, "Fiat", "147", "Roxo", 1920, 250000),
														            (2, "Fiat", "Uno", "Cinza", 1985, 125000),
                                                                    (3, "Fiat", "Siena", "Amarelo", 2014, 82564),
														            (4, "BMZ", "X5", "Prata", 2021, 1800),
														            (5, "Audi", "Q7", "Azul", 2020, 1300);

select * from veiculo;




insert into equipe_mecanicos (idVeiculo, nome, endereco, especialidade) values (1, "Marcos", "São joaquim", "Injeção Eletronica"),
														                       (2, "Foguinho", "Centro", "Me^ânica em Geral"),
                                                                               (3, "Macarrao", "Satelite", "Pintura"),
														                       (4, "Zé", "Joia", "Lanternagem"),
														                       (5, "Francisco", "Promorar", "Motor");

select * from equipe_mecanicos;



insert into servico (nome_servico) values ("Troca Injeção Eletronica"),
										  ("Manutenção supensão"),
                                          ("Pintura das portas"),
										  ("Desamassar Capô"),
										  ("Fazer Motor");

select * from servico;



insert into pecas (nome_peca, valor_peca) values ("Bomba injeção", 950.89),
												 ("Amortecedores", 754.99),
                                                 ("Verniz para vitrificação", 799.00),
												 ("Tela Fronta", 349.5),
                                                 ("Retifica", 2499.9);

select * from pecas;



insert into os (idOs, idMecanico, data_emissao, valor, status_os, data_concluido) values (1, 2, "2022-10-10", 2999.00, "Concluido", "2022-10-15"),
												                                         (3, 5, "2022-07-05", 999.99, "Em manutenção", "2022-11-11"),
                                                                                         (2, 4, "2021-01-01", 1854.00, "Orcamento", "2022-11-11"),
												                                         (5, 3, "2022-05-30", 600.0, "Em manutenção", "2022-11-11"),
                                                                                         (4, 1, "2022-11-10", 24975.99, "Concluido", "2022-11-10");

select * from os;


insert into servico_os (idServico, idOs, valor_mao_de_obra) values (1, 2, 299.00),
												                   (3, 5, 123.55),
																   (2, 4, 597.88),
																   (5, 3, 987.00),
                                                                   (4, 1, 18500.00);

select * from servico_os;


insert into pecas_os (idPecas, idOs, valor_pecas) values (5, 2, 468.00),
														 (4, 5, 754.55),
														 (3, 4, 132.88),
														 (2, 3, 584.00),
                                                         (1, 1, 645.00);

select * from pecas_os;


select a.idServico as cod_servico, a.nome_servico as servico, max(b.valor_mao_de_obra) as servico_mais_caro from servico_os b inner join servico a on a.idServico = b.idServico;
select sum(valor) from os where status_os = "Concluido";
select count(*) from os where data_emissao >= "2022-01-01";