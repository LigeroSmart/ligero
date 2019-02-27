## Gerenciamento de Processos

Licenciamento deste Manual/ Documento

____


### Visão Geral do Gerencimento de Processos 

O ligero Smart possui um construtor visual de processos que permite a elaboração de fluxos de tabalho (wor flows) utilizando seu macanismo de chamados.

A ideia básica é modelar procedimentos recorrentes, delegando tarefas e direcionando o fluxo de atendimento de acordocom certos critérios com estado, prioridade, valores em campos dinâmicos ect. 

__Dica importante:__ Para desenhar processo no Ligero Smart, __utiliza o navegador Chrme de preferência__. Já tivemos problemas graves com outros navegadores.

### Exemplo: Processo de Reembolso de Despesas

Para exemplificar o funcionamento de Gerenciador de Processos do Ligero Smart, vamos utilizar o exemplo da construção de um simplesprocesso de __reembolso de despesas__.

Basicamente, teremos o seguinte fluxo:

1. Alguém solicita o reembolsopreenchendo informações como valor de alimentação, taxi, etc. 
2. Esta solicitação cai para a aprovação de um gestor.
3. Aprovação
    1. Se reprovado, o chamdo é encerrado
    2. Se aprovado, o chamado é encaminhado para a fila de tesouraria para Pagament
4. Após o pagamento, o chamado é fechado e um novo chamado é criado para área de contabilidade fazer o lançamento no sistema contábil.

### Compos Dinâmicos 

Normalmente o desenho de work flows faz sentido a medida que automatizamos a obtenção e processamento de informcões. Work flows para "Processos de Reembolso", "Requisição de Compras" etc normalmente requeremo registro de informções que não existem por adrão no mecanismo de ticket do Ligero Smart, tais como "Valor de Taxi","Valor Alimentação" etc por isso, o ponto de partidaque recomendamos paraa paremetrização de processos éa definição e acriação decampos dinâmicospara o mesmo.
Neste exemplo, utilizaremos os seguintes campos dinâmicos:
* Quilometragem rodada(reeQuilometragem), no objeto chamado, tipo texto.
    * Se preferir, adicione uma expressão regular nas configurações do campo, para aceitar apenas números no campo.
* Valor Pedágio (reePedagio), no objeto chamado, tipo texto.
* Valor Táxi (reeTaxi), no objeto chamad, tipo texto.
* Valor Avião/Onibus (reeAviao),no objeto chamado, tipo texto.
* Valor Alimentação (reealimentação), no objeto chamado, tipo texto.
* Valor Hospedagem (reeHospedagem), no objeto chamado, tipo texto.
* Status Reembolso (reeStatus), no objeto chamado, tipo Dropdown, valores "Aprovação Pendente", "aprovado" e "Rejeitado".

__Importante:__ Faça a liberação destes campos dinâmicos na tela "Frontend::Customer::Ticket::ViewZoom"
Também é necessário liberá-los no subgrupo de parâmtros "Frontend::Agent::Ticket::ViewZoom" que está dentro de *Administração -> ProcessManagement*.
No parâmetro Tiket::Frontend::AgentTicketZoom###PrcessWidgetDynemicField adicione todos os campos que utilizaremos no processso:

img

__Além disso, para este nosso exemplo, precisamos de três filas novas no sistema:

* Gestores 
* Tesouraria
* Contabilidade

Crie as filas acimas antes de preceguir.

Com os campos dinâmicos e filas criados, podemos então __criar o processo__.

Acesse *Administração -> Gerenciamanto de Processos*

Clique em "Criar Novo Processo. Nomeie este Processo, dê uma descrimação e marque seu estado como "Ativo".

__*Atividades*__

Podemos entender as atividades como passos de cada processo. Verigique o noddo processo exemplo de reembolso abaixo:

img

Este processo simples é composto por 4 atividades:

* Preenchimento do Formulário de Reembolso, que é executado pelo cliente.
* Análise e Aprovação, que será executado por um gestor.
* Pagamento, que será executado pela tesouraria.
* Fim do processo. (netse momento, um outro chamado é criado para outra áre, a de contabilidade).
  
Crie 4 atividades descritas acima, clicando em *"Atividades"-> "Criar Nova atividade"*.
Por enquanto, apaenas dê o nome à atividade e clique em "Enviar".


*Apenas para informção*
* Cada elemento possui um código de identificação (exemplo: *Activity-736cb0a14b6a1ac160067af4bec5b57e*) que é conhecido como EntityID.
* As atividades ão conectadas pelas transições. Veremos adiante como criaá-las e utilizá-las para interligar as atividades.

Arraste as 4 Atividades criadas para o painel posionando de forma semelhante a disposição dos elementos na imagem abaixo:

img

__*Janelas de Atividade*__

Janelas de Atividade são telas de interação que podemos sisponibilizar em cada atividade do processo. Cada atividade deve ossuir uma ou mais Janelas de Atividades (exceto a tividade "Fim do Prcesso" de nosso exemplo).

Nas janelas de atividade, dispomos os campos dinâmicos que queremos que sejam preenchidos em cada momento doprocesso. Na prátia, é lá que ocorre a interação do atendente ou ciente com o chamado de processo.

Em nosso exemplo, teremos as seguintes Janelas de Atividades em cada Atividade:

* Preenchimento do Formulário de Reembolso
    * Formulário de Reembolso
    * Solicitar Aprovação
* Ánalise e Aprovação
    * Aprovação
* Pagamento
    * Efetuar Pagamento

Vamos agora ciar as janelas de atividade:

__Formulário de Reembolso__

Clique em *Janelas de Atividade -> Criar Nova Janela de Atividade*.

img

A seguinte janela é apresentada:

img

Em "Nome da Janela de atividade" coloque "Formulário de Reembolso".

O campo "Disponível em" define onde esta janela de atividade estará disponível, se apenas na interface de atendentes ou clientes ou se ambas. Neste caso,estará nas duas interfaces pois o cliente também poderá solicitar o reembolso diretamente através de sua interface, por isso escolha "Agent and Customer Interface".

No campo "Descrição Curta" você pode repetir o nome da janela de atividade.

No campo "Descrição Longa" é opcional.

O campo "Permissões" define qual a permissão necessária para se enxergar esta tela, de acordo com a fila onde o chamado se encontra no momento em que o processo do mesmo está na atividade atual.
Por exemplo, se você definir "Leitura e Escrita"e o chamado estiver na fila "Tesouraria", apenas atendentes com permissão "Leitura e Escrita" nesta fila terão acesso a esta janela de atividades.

O campo "Requer Bloqueio" define se para acessar este tela, será necessário ser o propriietário do chamado e bloqueá-lo. Se você definir sim, apenas o proprietário do chamdo terá permissão de acessar a tela, ou qualquer atendente da fila no caso do chamado estar desbloqueado. Para nosso exemplo, defina "Sim".

Em "Submit Advice Text" você pode configurar uma dica que é exibida ao lado do botão de submissão do formulário.

Em "Submit Button Text" você pode alterar o texto padrão ("Enviar") do botão de submissão do formulário.

Agora precisamos colocar os campos que serão exibidos ou trabalhados nesta tela.

Esta será a tela inicial do processo, visto que colocaremos  ela como primeira janela de atividade, primeira atividade do mesmo, por isso, será necessário também alguns campos de caixa "Campos Dsiponíveis" para a caixa "Campos Atribuídos", ao arrastar, o sistema solicitará algumas informações que também explicaremos a seguir:
* Arraste o campo campo ID do Cliente
    * A tela "Editar Detalhes do  Campo Customer ID" é exibida. Mantenha os valores padrão e cliqueem *Salvar*.
    * Obs: Este campo só é exibido na interface de atendente.
* Arranste o campo Artigo.
    * Atere o "Tipo de Artigo" para "chamado web".
    * Altere a propriedade "Exibir" para "Show Field As Mandatory" e clique em *Salvar*.
* Arraste o campo "Fila"
    * Altere o valor padrão para "Tesouraria"
    * Altere a exibiçào para "Do not show field"
* Arraste os campos a seguir e mantenha os detalhes padrões
    * Quilometragem rodada
    * Valor Pedágio
    * Valor Táxi
    * Valor Avião/Onibus
    * Valor Alimentação
    * Valor Hospedagem 
Finalmente clique em *Enviar*.

Agora clique e arraste o "Formulário de Reembolso" para dentro da atividade "Preenchimento do Formulário de Reembolso".

img

Se tudo deu certo, ao passar o mouse em cima da atividade "Preenchimento do Formuláriode Reembolso", você verá que a janela de atividade "Formulário de Reembolso" está dentro da mesma, como na figura a seguir:

img

Vamos criar agora uma janela "__Solicitar Aprovação__":

* Adicione uma nova janela de atividade que será disponível para o cliente e atendente
* permissão Leitura e Escrita 
* Bloqueio requerido
* Inclua apenas o campo __reeStatus__
* Arraste também esta janela recém-criadas para a atividade "Preenchimento do Formulário de Reembolso".

Agora vamos criar uma janela "__Aprovação__" quedeverá ser ncluída na atividade "Análise e Aprovação". Adicione uma nova janela de atividade que será disponível para atendente apenas, permissão de Leitura e Escrita, Bloqueio requerido e inclua apenas campos:

* Artigo
    * Descrição curta: Justificativa
    * Descrição longa: Justifique aqui a decisão tomada
    * Tipo: nota-externa
    * Obrigatório
* reeStatus
    * Obrigatório

Arraste esta janela para a atividade de "Análise e Aprovação".

Agora vamos criar uma janela "__Efetuar Pagamento__"que deverá ser incluída na atividade "__Pagamento__".
Adicione uma nova janela de atividade que será dísponivel para atendentes apenas, permissão Leitura e Escrita, Bloqueio requerido e inclua apenas os campos:

* Artigo 
    * Descrição curta: Detalhes do Pagamento
    * Descrição longa: Descreva a forma de pagamento
    * Tipo: nota-externa
    * Obrigatório
* Estado
    * Obrigatório

Arraste esta janela para a atividade "Pagamento".

__*Trnasições*__

As transições são fundamentais para o funcionamento do processo. Funcionam como gatilhos para levar o chamado para uma nova atividade ou outra de acordo com  condições que podemos determinar.

Neste exemplo, teremos 4 transições possíveis como podemos verificar na imagem abaixo:

img

* Aprovação Pendente - verifica se o valor do campo __reeStatus__ é igual a "Aprvação Pendente". Se sim, o processo será direcionado para atividade "Ánalise e Aprovação"
* Reembolso Rejeitado - verifica se o campo __reeStatus__ é igual a "Rejeitado" e move o processo para atividade "Preenchimento do Formulário de Reembolso".
* Aprovado - verifica se o campo __reeStatus__ é igual a "Aprovado" e move o processo para a atividade "Pagamento".
* Chamado Encerrado - Verifica se o chamado foi encerrado com êxito e move o chamado para a atividade "Fim do Processo".

Vamos cirar nossa primeira transição clicando em *Transições -> Criar Nova Transição*:

img

No campo "Nome da Transição" coloque "Aprovação Pendente".
A seguir, precisamos definir as condições que gatilham esta transição.
Faremos então um pequeno parênteses aqui para explicar como confgurar as condições.

#### Condições

Podemos inserir uma condição apenas para nosso gatilhados ou várias condições combnadas. O campo "Tipo de Ligação Entre as Condições" determinada que tipo de relação lógica deve prevalecer no caso de utilizarmos mais que uma condição. Se você está trabalhando apenas com uma condição, não precisa se preocupar com isto, caso contrário, você precisa entender os tipo: 

* E - Todas as condições precisam ser verdadeiras para que a transição ocorra 
* Ou - A transição ocorre caso qualquer uma das condições definidas seja verdadeira
* xor - A transição ocorre se apenas uma condição das várias definidas for verdadeira.

Possuímos dois níveis de condiçãoes, o que nos permite criar condições multiplas combinadas, por exemplo:

Se ((Prioridade = Alta __e__ Tipo = Incidente) __ou__ (Prioridade = Muito Alta __e__ Tipo = Incidente)) ou a mesma regra configurada de outra maneira:
Se ((Tipo = Incidente) __e__ (Prioridade = Muito Alta __ou__ Prioridade = Muito Alta))

Em seguida, temos que definor o nome do campo do chamado que será analisado.

Podemos trabalhar com os seguintes valores (principais):
* Title
* State
* StateID
* Priority
* Lock
* LockID
* Queue
* QueueID
* Customer
* CustomerID
* CustomerNo
* CustomerUserID
* Owner
* OwnerID
* Type
* TypeID
* SLA
* SLAID
* Service
* ServiceID
* Responsible
* ResponsibleID
* PendingTime
* DynamicFiel_$FieldName (onde $FieldName é o nome do campo dinâmico)

Temos mais um detalhe, o "Tipo" de verificação do campo, que pode ser:

* String: Verifica se o valor do campo é exatamentte o digitado
* Regexp: faz uma verificação utilizando expressão regular
* Transition Validation Module: trata-se deuma maneira mais avançada de gatilhar a transição, chamando um módulo perl externo, que pode realizar cáculos mais avançados ou mesmo consultar informações em outros sistemas externos para então gatihar a transição entre atividades.

Neste nosso exemplo, queremos criar a transição "Aprovação Pendente" que verifica o campo reeStatus (DynamicField_reeStatus). O preenchimento da tel ficaria desta forma:

img

Realize entào o cadastro desta transição e clique em *Enviar*.

Agora que criamos a transição vamos conectá-la às atividades. Clique e arraste a transição para a atividade de origem, neste caso "Preenchimento do Formulário de Reembolso" e solte. O desenho ficará asim:

img

Agora clique na bolinha vermelha na ponta da transição (a cor da linha deve mudar para amarelo) e arraste até a atividade "Análise e aporvação", até que a mesma fique com a brda amarela, e solte o botão do mouse. Deverá focar assim:

img

OK! Vamos criar agora as demais transições:

img

__Importante:__ se você nào traduziu manualmene os estados padrões do seu sistema no menu *Administração -> Estados,* você deverá inserir o nome do estado em ingleês, conforme está cadastradono sistema.

Conecte as demais transições criadas conforme a figura a seguir:

img

### Ações deTransição 

Uma vez que conectamos todas as atividades utilizando as transições, podemos definir ações que são executadas no chamado quando umatransição entre atividades ocorrer.

Em nosso exemplo, vamos realizar as seguintes ações quando cada transição abaixo ocorrer:
* Aparovação Pendente
  * Mover chamado para fila Gestores
* Reembolso Rejeitado 
    * Mover chamados para a fila Tesouraria 
    * Fechar chamado com êxito
* Aprovado 
    * Mover chamado para fila Tesouraria 
* Chamado Encerrado
    * Criar um novo chamado para a fila Contabilidade, solicitando a conciliação cotábil

Note que a ação "Mover chamado para fila Tesouraria" é comum a duas transições.
__Vamos criar as ações.__ Clique em *Ações de Transição*.

Primeiramente defina o neme da ação. Vamos começar com a "Mover chamado para fila Gestores".

As ações de transição utilizam módulos para executar suas atividades. Neste exemplo, vamos utilizar o módulo __TicketQueueSet__ que altera o chamado de fila (adiante explicaremos a função de outros módulos).

Em Parâmetros de Configuração, no campo "Chave"digite "__Queue__" (sem aspa). Em "Valor" digite "Gestores" (sem aspas):

img

Vamos criar uma ação "Mover chamado para a fila Tesouraria" que utiliza o mesmo módulo TicketQueueSet:

img

Agora vamos criar a ação "Fechar chamado sem êxito". Para isso, vamos usar o módulo TicketStateSet:

img

Note que o parâmetro "Chave" colocamos o valor "State" e no parâmetro "Valor" colocamos o nome do estado. Se você não introdziu os estados padrões do Ligero Smart, coloque "closed unsuccessful". 

Finalmente, vamos criar uma transição para __realizar a criação de um novo chamado na fila Contabilidad__, quando o processo de reembolso for encerrado.

Crie uma nova ação de transição com o nome "Novo Chamado - Contabilidade" 

Escolha o módulo da Ação de Transição "TicketCreate"

Vamos preencher os seguinte "Parâmetros de Configuração":

tabela

Veja como fica:

img

Mais adiante neste documento, você encontra a referência de todos os parâmtros posssíveis para a utilização em cada ação de transição.

__Agora arraste as ações de transição para dentro das respectivas transições.__

Clique em "*Salvar e Finalizar*"

__*Executando e ajustando o processo criado*__

Agora clique em "Sncronizar Todos os Processos".

img

Acesse a interface de cliente e façalogin.

Acesse *Chamado -> Novo Chamado via Processo*

img

Escolha "Processo de Reembolso", preencha o formulário e clique em *Enviar*.

img

Veja como fica a tela do chamado na interface do cliente após a criação do mesmo:

img

Note que na caixa "Informação" temos os campos dinâmico que foram oreenchidos. Veja queos mesmo se encontra na fila "Tesouraria"conforme configuramos. Também vereificamos o nome do processo e ao atividade na qual o mesmo se encontra neste momento.

Logo abaixo, na caixa "Próximos Passos", temos as Janelas de Atividades que estão disponíveis para esta atividade e liberadas para o cliente.

Clique em Solicitar Aprovação:

img

Veja que as opções de aprovação do chamado estão disponíveis para o cliente, mas não queremos isso não é mesmo?

Vamos restringir a exibição apenas do valor"Aprovação Pendente". Pata isto, crie ACL como a seguir:

img

Note que "AtctivityDialog-52ad1761ae0e17018871aa3931849613" é o código da janela. Aprovação Pendente de atividade. Verifique qual éo código da sua Acti

