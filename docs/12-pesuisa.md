## Pesquisa

Licencimanto deste Manual/Documento

---------

## Apresentção

O módulo de pesquisa do Ligero Smart éuma funcionalidade para criar pesquisas que os clientes dos chamados fechados são convidados a preencher.

## Instalação

Para realizar a instalação da Pesquisa no Ligero Smart, vamos seguir o mesmo modelo do manual 08 - Gerenciamento de Pacotes.
Realize o download do módulo da FAQ pelo link abaixo
Link????
Ao acessar o link, vá em "Public Extensions" -> for Ligero ---- -> Survey -> Survey ----

Após finalizar o download, acesse *Administração -> Gerenciador de Pacotes.*
Clique em "Escolher arquivo" e selecione o arquivo Survey --- e em seguida clique em *Instalar Pacote*.
Na tela seguinte, clique em *Continuar*, conforme imagem abaixo:
Na próxima tela, o sistema mostra o informativo da isntalação, clique em *Continuar*.
A tela seguinte é o do Gerador de Pacotes, onde no Repositório local já mostra a Pesquisa (Survey) instalada.

## Configurações 

Em Administração do Sistema, procure no lisbox Survey -> Core::Survey.
Survey::ShowVoteData: Habilita a pesquisa dos chamados.
Survey::NotifictionSender: Define quel e-mail vai enviar a pesquisa.
Survey::NotificationSubject: Titulo do e-mail.
Survey::NotificationBody: Define o Corpo do e-mail.
Survey::SendInHoursAfterClose: Define a quantidade de horas para a pesquisa ser enviada após o fechamento do chamado.
Survey::AmountOfSurvaeyPer30Days: Quantidade máxima de pesquisa em 30 dias.
Em Survey: -> Core, temos a seguinte opção:
Survey::NotificationRecepientBlacklist: Define e-mails que nào receberão a pesquisa.

### Criar uma nova Pesquisa

Para criar uma nova pesquisa, no toolbar clique em *Pesquisa -> Nova.*
Preencher os campos Títulos, Introdução, Rementente, Assunto, Corpo, Filas e Descrição Interna.
Nesse caso a Fila é para qual fila será enviada a pesquisa. Podemos inserir várias pesquisas para filas diferentes.

#### Inserindo Perguntas 

Para inserir perguntas, clique em *Editar Perguntas* conforme imagem abaixo:

img

Você pode inserir 4 tipos de perguntas, segue imagem:

img

SimNão: Pergunta que possibilita resposta de Sim ou Não.
Radio (Lista): Pergunta que possibilita apenas uma opção para escolha.
Checkbox (Lista): Pergunta que pode escolher várias respostas.
Área de Texto: Pergunta com o campo para resposta dissertativa.

img

Adicionando a pergunta, para inserir as resposta no caso de Radio e CheckBox, clique em na pergunta no campo *Perguntas de Pesquisas*.
Insira a resposta, conforme imagem abaixo:

img

Lembranco que os tipos Radio e Checkbox, é necessário uas resposta no mínimo.
Configurado as perguntas, clique em *Voltar* e depois 

