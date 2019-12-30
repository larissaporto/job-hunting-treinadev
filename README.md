# README

Primeiramente gostaria de agradecer a equipe! Aprendi e reforcei muitas coisas que vi!

Estou trabalhando com o Ruby 2.6 e o Rails na versão 5.2. 
As gems instaladas são: capybara, rspec, bootstrap, devise. Não fiz alteração do Database.

RESUMO GERAL

A plataforma possui 2 models devise: uma para o candidato, Applicant, e o outro para o Headhunter.
Quando o candidato se registra, automáticamente é criado o Perfil, profile, associado a sua conta devise.
Enquanto o status do profile mudar para done, o candidato ao fazer o log in será levado para editar perfil.
O profile possui as views de vagas inscritas e minhas propostas.

Nas vagas, jobs, o index mostra as vagas por ordem decrescente de criação. 
Falta alterar o status quando o vencimento da vaga chega. Ainda em job podemos criar e ver o show. O created é uma action das vagas criadas pelo Headhunter. O headhunter não possui perfil, assim o job ficou com o controle de algumas das ações exclusivas do headhunter como também a lista de candidatos inscritos para cada vaga e o encerramento da vaga

A action start em jobs é o início para a inscrição de candidatos. A partir dela o candidato será redirecionado para inscrição, apply, para acrescentar uma cover letter para a vaga.

Na inscrição, apply, o candidato é levado para a action de edit pois a criação da classe foi feita em job. 

O headhunter pode fazer o destaque de candidatos inscritos para determinada vaga, rejeitar, deny, enviando o feedback e aceitar, allow, para iniciar o processo de enviar a proposta com a criação da classe em apply 

O feedback de rejeição de candidato é a classe comment e elá é um nested resource de profile. 

Na classe da proposta, proposal, continua o processo de enviar proposta entrando na action edit e depois de criada ela fica disponível para o candidato. Assim, o candidato pode aceitar, pass, e as outras propostas em aberto são automaticamente rejeitadas e refuse com a possibilidade de dar um retorno com a class evaluation.

CONSIDERAÇÕES ADICIONAIS

A prioridade nesse projeto foi dada para o funcionamento mínimo da plataforma. 

Os testes dos pontos principais elecandos da aplicação no PDF foram feitos por meio das features. Os testes unitários foram feitos por conta dos atributos com datas iniciais e vencimentos. 

As validações foram feitas para evitar que os atributos fique em branco ou nulos. Com exceção do profile, é possível atualizar o perfil até que ele fique completo. Só assim é possível ver a inscrição.

A validação Headhunter rejects applicant for a job successfully funciona quando desabilito o botão de aceitar. Não consegui acerta o scope do capybara.

Obrigada
