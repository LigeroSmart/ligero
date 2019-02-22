## Configurações de Chamados 

### Licenciamento deste Manual/Documento

???

### Notificações de Chamados

O Ligero permite o envio de notificações de tickets aos atendentes e clientes, com base na ocorrência de certos eventos. Os atendentes podem personalizar suas configurações de notificação de tickets atrav's do link "prêferencias".

img

Para acessar as notificações, vá em *Administração -> Notificações de chamados*:

O Ligero vem com um conjunto de notificações pré-definidas que cobrem uma vasta gama de casos de uso:

Abaixo, exibiremos algumas das opções para configuraçào das notificações:

__*Eventos*__

Aqui selecionamos o gatilho que irá disparar a notificação.

Resumidamente, descrevemos o momento em que cada um é disparado. Abaixo, citamos como exemplo alguns dos eventos mais importantes:

__ArticleCreate__ -  Ao criar um novo artigo no sistema (notas, respostas etc).

__ArticleSend__ - Ao enviar um artigo por e-mail.

__ArticleBouce__ - Ao desenvolver um chamado (botão Devolver).

__TicketCreate__ - na criação do chamado.

__TicketTitleUpdate__ - Ao alterar o titulo chamado.

__TicketUnlockTimeoutUpdate__ - Quando o chamado é desbloqueado automaticamente.

__TicketQueueUpdate__ - Quando o chamado muda de fila.

__TicketTypeUpdate__ - Ao alterar o tipo do chamado.

__TicketServiceUpdate__ - Quando o serviço do chamado é alterado.

__TicketSLAUpdate__ - Quando o chamado tem o seu SLA alterado.

__TicketCustomerUpdate__ - Quando um cliente é atribuiido ao chamado ou quando é alterado.

__TicketPendingTimeUpdate__ - Quando o horário e data de pendencia é alterado.

__TicketLockUpdate__ - Quandoum chamado é bloqueado ou desbloqueado.

__TicketStateUpdate__ - Quando o estado do chamado é alterado.

__TicketOwnerUpdate__ - Quando o proprietário do mesmo é atualizado.

__TicketResponsibleUpdate__ - Quando o Responsável por ele é alterado.

__TicketPriorityUpdate__ - Quando a prioridade do chamado é alterada.

__TicketAccountTime__ - Quando o tempo contabilizado de um chamado é alterado.

__TicketMerge__ - Quando um chamado é agrupado a outro.

__TicketSubscribe__ - Quando alguém começaa monitorar o chamado.

__TicketUnsubscribe__ - Quando um atendente para de monitorar um chamado.

__EscalationResponseTimeNotifyBefore__ - Quando um chamado atinge o tempo de notificação de segurança para a primeira resposta (notificar por X%).

__EscalationResponseTimeStart__- Quando o tempo de primeira resposta estoura.

__EscalationTimeStop__ - Quando tempo de primeira resposta é atendido (dentro ou fora do prazo).

__EscalationUpdateTimeNotifyBefore__ - Quando um chamado atinge o tempo de notificação de atualização (notificar pr X%).

__EscalationUpdateTimeStart__ - Quando o tempo de atualização estoura.

__EscalationUpdateTimeStop__ - Quando o tempo de atualização é atendido (dentro ou fora do prazo).

__*Filtro de Chamado*__

img

__*Destinátarios*__

Os seguintes parametros permitem selecionar os destinatários da notificação: 

__Grupos Destinatários:__ Permite escolher entre Proprietário do Chamado, o Respnsável, atenedentes com permissão de escrita e/ou Cliente (pressione a tecla Ctrl para selecionar mais um)

__Atendentes Destinatários:__ Permite escolher atendentes específicos para receber as notificações.

__Grupos Destinatários:__ Selecione atendentes de um ou mais grupos específicos (ou papeis que dão permissão a estes grupos).

__Papel Destinatários:__ Selecione atendentes de papéis específicos para receber as notoficações.

__Endereços de E-mail Destinatários:__ Digite e-mails específicos para receber as notificações, separe por virgula diversos e-mails.

__Papéis Destinatários:__ Selecione os Papéis que receberão as notificações, podendo ser mais de um papél.

Nesta parte, podemos definor as condições necessárias do chamado para que a notificação seja disparada. Podemos escolher deste atributos padrão do sistema (como Tipo, Estado, Prioridade, etc) como também Campos Dinâmicos.

__*Filtro de Artigo*__

img

Segue o mesmo padrão de funcionamento do Filtro de Chamado, com a diferença de que só funciona com os eventos ArticleCreate e ArticleSend.

__*Destinatários*__

img

Nesta parte podemos definir os destinatários da notificação de acorde com alguns creitérios disponíveis (grups,, papéis, atendentes, etc.). Todos os destinatários configurados receberão as notficações.

__*Métodos de Notificação*__

img

Esta parte traz algumas opções para serem aplicadas ao método de notificação por E-mail.

__*Texto da Notificação*__ 

img

Nesta parte, definimos o assunto e o texto que será exibido na notificação. No campo assunto, não é necessário adicionar o número do chamado, por isto jáé adicionado, por padrão,em todas as notificações.

Essas notificações podem conter formatação HTML e utilizar as TAGs de Notificação Ligero, como mostra a imagem anterior.

Também é possível dsiponibilizar a notificação em mais de um idioma.

### Tipos 

Os tipos ajudam a ter mais uma dimensão de categorização do chamado. Na instalação padrão Help Desk, este campo não vem ativo, mas pode ser habilitado através do parametro Ticket::Type.

Quando instalado o módulo ITMS do Ligero, o tipo é ativado e novos são criados automaticamente.

### Estados

A lista de estados padrões do sistema pode ser encontrado no arquivo ???

Novos estados podem ser criados e escolher o tipo de estado.

Criando um estado do tipo "fechado", fará com que os chamados que forem classificados neste estado saiam das listagens de chamados em tratamento. Este estado também paralisará a contagem de tempo de escalação de solução.

Estados do tipo "lembrete de pendente", disparam alertas quando os chamados atingem o tempo de pendencia marcado no campo "Data de Pendencia".

Estados tipo "Pendente Automático", podem mudar automaticamente o estado de um chamado para outro quando a data de pendencia é atingida. Você pode criar por exemplo um estado chamado "Aguardando Cliente" que ao atingir a Data de Pendencia, altera automaticamente o estado do chamado para "aberto".

Para configurar estados "pendentes automaticos", acesse *Admin -> Configurações de Sistema -> Ticket -> Core::Ticket* e adicione novos valores na chave "Ticket::StateAfterPending". No campo Chave, adicione por exemplo "Aguardando Cliente", e no campo Conteúdo, defina "Open" (Estados padròes do Ligero Smart devem ser colocados em inglês):

img

### Prioridades

É possível alterar anomeclatura das prioridades no Ligero Smart.

Também é possível desativar ou adicionar novas prioridades. Porém, para adicionar novas prioridade é necessário fazer uma configuração de cores via CSS, conforme o tutorial abaixo

forum ???

### Serviços

Em instalações Help Desk, é necessário ativar o recurso de "Serviço" antes de utilizá-lo. Para isto, acesso Admin -> Configurações de Sistema -> Ticket -> Core::Ticket e altere o parametro Ticket::Service para "Sim".

### Acordos de Nível de Serviço 

SLA (Service Level Agreement) ou ANS (Acordo de Nível de Serviço em Português), é um acordo emtre o provedor de serviços de TI e seu cliente, quanto a qualidade ou garantia dos serviços prestados.

Definimos onde o escalonamento dos chamados podem ocorrer em três momentos diferentes:

__Escalação - prazo da resposta inicial (minutos): 

Determina um tempo máximo de resposta para que a equipe de atendimento avalie e dê uma primeira resposta ao cliente, por e-mail ou por telefone.

__Escalação - prazo de atualização (minutos): 

Determina o peíodo máximo que o cliente receber um follow up da equipe de atendimento. Em outras palavras, quando a equipe de atendimento responder ao cliente, este SLA reinicia sua contagem até que uma novo resposta seja dada, ou até que o chamado esteje encerrado.

__Escalação - prazo de solução (minutos):
Tempo estipulado para resolver o problema do chamado.

O escalonamento ocorre quando estes tempos não são respeitados.

Para auxiliar a equipe de atendimento no cumprimento destes acordos, o ligero disponibiliza avisos por email e SMS, de forma a comunicar gestores, o suorte ou cliente deque já se passou determinada quantidade do tempo proposto para SLA, ou mesmo que o tempo já foi ultrapassado.

E por último, é importante citar que o tempo do SLA é contado apenas no horário de "comercial" proposto pela empresa, respeitando inclusive feriados que podem ser configurados na administração do Ligero Smart. Veremos isto mais adiante.

Cada SLA pode conter um ou mais serviços. Cada serviço pode fazer parte de um mais SLAs.

SLAs baseados em grupo de clientes ou SLAs VIPs podem ser definidos com módulos extras do Ligero Smart ou através de ACLs (veremos mais adiante como criá-las).

### Campos Dinâmicos 

No Ligero Smart é possível criar campos extras para artigos e chamados.
Você pode criar os seguintes tipos de campor dinâmicos:

img

__Data__ (você pode encontrar as vezes traduzido por "Dado")

Uma vez criado um campo dinâmico, é necessário dizer ao sistema em quais telas este deverá ser solicitado ao atendente ou ao cliente, se será obrigatório ou nào e em quais telas ele será visualizado.

Para isto, acesse Administração -> Configuração do Sistema -> Ticket.

Você deverá entrar em cada grupo de configuração correspondente a tela onde deseja exibir o campo.

Veja abaixo, as telas onde você configura a entrada de dados.

Na tela __Frontend::Agent::Ticket::ViewNote__ , adicionando chaves no parâmetro DynamicField. Na chave, coloque o nome do campo. No conteúdo 1 para habilitar e 2 para tornar obrigatório, como abaixo: 

img

Telas que podemos exibir nosso campo dinâmico.

__Frontend::Agent::Ticket::ViewClose__ - TEla exibida ao clicarmos no botão "Fechar".

__Frontend::Agent::Ticket::ViewCompose__ - Tela exibida ao compor uma resposta por e-mail a um cliente.

__Frontend::Agent::Ticket::ViewEmailNew__ - Tela para criar novo chamado por e-mail.

__Frontend::Agent::ViewForward__ - Tela exibida ao clicar no botão "Encamnhar". 

__Frontend::Agent::Ticket::ViewMove__ - Tela que permite adicionar uma anotação antes de mover um chamado. Esta tela não é exibida por padrão, é necessário habilita-la neste mesmo conjunto de parametros.

__Frontend::Agent::Ticket::ViewNote__ - Tela "Nota".

__Frontend::Agent::Ticket::ViewOwner__ - Tela "Proprietário".

__Frontend::Agent::Ticket::ViewPhoneInbound__ - Tela "Chamada Telefônica Recebida".

__Frontend::Agent::Ticket::ViewPhoneNew__ - Tela para criar novo chamado por telefone (Chamado Fone).

__Frontend::Agent::Ticket::ViewPhoneOutbound__ - Tela "Chamada Telefônica Realizada".

__Frontend::Agent::Ticket::ViewPrint__ - Tela "Imprimir".

__Frontend::Agent::Ticket::ViewPriority__ - Tela de "Prioridade".

__Frontend::Agent::Ticket::ViweResponsible__ - Tela "Responsável".

Além disto, podemos habilitar a pesquisa de chamados através destes campos dinâmicos que criamos, acessando o conjunto de parâmetros __Frontend::Agent::Ticket::ViewSearch.__ 

Neste caso, no parametroDynamic, o valor 1 serve para disponibilizar o campo na lista de filtros possíveis, o valor 2 serve para além de disponibilizar, exibi-lo por padrào, como abaixo: 

img

O parametro Defaults##DynamicFiels, permite configurar valores padrões para a pesuisa.
Eo parametro SearchCSVDynamicField, faz com que o campo seja exportado no CSV quando alteramos a saída da pesquisa para este formato.

__Frontend::Agent::Ticket::ViewZoom__ - Tela de visualizaçào do chamado. Aqui, configuramos a exibição dos campos dinâmicos. basta colocar 1 no Conteúdo para que este campo seja exibido.

__Frontend::Agent::TicketOverview__ - Tela de listagem de chamados.

Também podemos disponibilizar os campos dinâmicos na interface do Cliente, através dos conjuntos de parametros a seguir:

__Frontend::Customer::Ticket::ViewNew__ - Tela para criar novo chamado na interface de cliente.

__Frontend::Customer::Ticket::ViewPrint__ - Tela para impressão do chamado.

__Frontend::Customer::Ticket::ViewSearch__ - Tela de Pesquisa da interface do Cliente.

__Frontend::Customer::Ticket::ViewZoom__ - Tela de visualização do chamado.

__Frontend::Customer::TicketOverview__ - Tela de listagem de chamados.





