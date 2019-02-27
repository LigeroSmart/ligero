## Configurações de Filas 

### Filas 

Recomendamos que sejam criados no máximo 3 níveis de filas e subfilas. Veja o que é importante na criação de filas:


__Grupos:__ Para se criar uma fila, antes é necessário criarmos um grupo de permissão ao qual esta fila será atrelado. Mas isto é fácil, basta acessar Administração -> Grupos, adicionar um novo preenchendo apenas seu nome.

__Tempo de Expiração De Desbloqueio minutos:__ Tempo em minutos (dentro do horário de trabalho) que um chamado pode ser bloqueado sem nenhuma interação do atendente, naquela fila. Passsando esse tempo, o chamado é automaticamente desbloqueado e volta para a fila como chamado disponível.

#### Prazo de Escalação

É possível determinar um prazo de escalação para os chamados de acordo com a fila em que se encontram, ou seja, se o chamado estiver naquela fila, tera determinado tempo para solução ou primeira resposta, contando sempre dohorário de criação do chamdo, e não do horário em que foi enviado para aquela fila.
No entento, se um SLA foratribuído ao chamado, o tempo de escalação definido na fila deixa de valer para este chamado.
Vejamos a seguir, os tipos de escalação que podem ser configurados nas filas:

__Escalação - prazo da resposta inicial (minutos):__ Define o tempo máximo em minutos para que o atendente faça um primeiro contato por e-mail ou telefone com o cliente. Se não cumprido, o chamado será escalado.

__Escalação - prazo de atualização (minutos):__ Após uma resposta a um cliente a um chamado aberto, o SLA de atualização começa a contar. Se o tempo definido em minutos é atingido, então o chamado é escalado.

__Escalação - Prazo de Solução:__ Prazo máximo em minutos para soluçào do chamado.

__Opção de Revisão:__

Define o comportamento do sistema quando recebemos um e-mail referente a um chamado já encerrado:

1. Possível - o sistema reabre o chamado.
2. New Ticket - o sistema cria um novo chamdo com o e-mail que chegou após o encerramento do chamdo anterior.
3. Reject -  O sistema mantém o chamdo fechado e adiciona o texto do e-mail no mesmo chamado.

__Bloqueio do chamado após uma Revisão:__ Se um chamdo está fechado e o cliente envia um acompanhamento, o chamado será bloqueado para o antigo proprietário.

__Endereço do Sistema:__ Remetente dos e-mails que foram enviados ao cliente, quando o chamado estiver nesta fila. (Não se aplica às notificações de sistema)

__Saudação:__ Saudação que será utilizada nesta fila ("Olá", "Prezado(a) Senhor(a)" etc)

__Assinatura:__ Assinatura utilizada na fila ("Atenciosamente, Fulano de Tal", "Telefones" etc)

__Calendário:__ Calendário de operação da fila. Se houverem SLAs definidos nos tickets desta fila, o calendário que valerá éo o do SLA, bem como os prazos de escalação.

__Validades:__ Seguindo o conceito de manter a integridade das informações, não é possível excluir uma fila do sistema, apenas invalidá-la para que deixe de ficar operacional.

### Anexos

O menu anexos permite que você faça upload de arquivos para o servidor do Ligero Smart. Estes arquivos podem ser utilizados em seguida para comporRespostas e Autorrespostas padrões do sistema.

Após a criação dos anexos, pdemos associar modelos de respostas com os anexos criados em Anexos <-> Modelos.

### Autorrespostas 

As auto respostas são mensagens enviadas aos clientes em determinadas ocasiões. Por exemplo, quando um novo chamado é criado, é possível criar uma Auto Resposta informando ao mesmo o número de seu chamado.

Ao cadastrar uma Auto Resposta, você deverá informar o tipo da mesma. Suas opções são:

1. Autorresposta: Resposta que será enviada ao cliente, caso ele crie um chamado.
2. Autorresposta/Novo Chamado: Caso a fila esteja configurada para criar um novo chamado quando o chamado anterior esteja fechado, e o cliente envia uma mensagem, esta auto resposta será enviada.
3. Autorrejeitar: Caso a fila esteja configurada para rejeitar novas mensagens em chamados encerrados, esta mensagem será enviada.
4. Autorrevisão: Enviado sempre que um cliente envia uma resposta a um chamado em andamento.
5. Autorremover: Chamados que serão removidos receberão a resposta de remoção do chamado.
Após a criação das autorrespostas, é necessario atribuí-la às filas correspondentes. Para isto, acesse Autorrespostas <-> Filas.

### Modelos 

Um modelo é um texto padrão que ajuda os atendentes a redigir chamados, respostas ou encaminhamentos mais rapidamente. Por padrão, há 2 tipos: 

1. Respostas em branco
2. Resposta de teste

Ao criar um modelo, você deve definir o tipo do mesmo. O tipo determina onde estes modelos serão disponibilizados:

__Criar:__ Disponíveis nas telas Novo Chamado fone ou e-mail

__Chamada Telefônica:__ Disponíveis nas telas Chamada Telefônica Recebida ou Realizada

__Encaminhar:__ Disponíveis na tela "Encaminhar".

__Responder:__ Disponíveis na tela "Responder".

__Nota:__ Disponíveis na tela "Nota".

Após a criação dos modelos, é necessário atribuí-los às filas correspondentes. 
Para isto, acesse Modelos <-> Filas.

### Saudações e Assinaturas 

Saudações são introduduções inseridas por padrão antes do corpo de uma resposta. Assinaturas são inseridas depois e podem der sofisticadas, utilizando imagens e HTML. Deve-se apenas ter cuidado para evitar criar assinaturas extremamente carregadas ou com imagem e links para facebooks corporativos, já que isto pode ocasionar o bloqueio das imagens do sistema em servidors se e-mail, nas caixas de spam.

Uma vez configuradas, tanto saudaç˜es quanto assinaturas devem ser atribuídas a suas respectivas filas, nas configurações de cada fila diretamente.


