## Gerenciamento de Processos

Licenciamento deste Manual/ Documento

____


### Visão Geral do Gerencimento de Processos 

O ligero Smart possui um construtor visual de processos que permite a elaboração de fluxos de tabalho (work flows) utilizando seu macanismo de chamados.  
A ideia básica é modelar procedimentos recorrentes, delegando tarefas e direcionando o fluxo de atendimento de acordo com certos critérios com estado, prioridade, valores em campos dinâmicos ect.  

__Dica importante:__ Para desenhar processo no Ligero Smart, __utiliza o navegador Chrome de preferência__. Já tivemos problemas graves com outros navegadores.

### Exemplo: Processo de Reembolso de Despesas

Para exemplificar o funcionamento de Gerenciador de Processos do Ligero Smart, vamos utilizar o exemplo da construção de um simples processo de __reembolso de despesas__.

Basicamente, teremos o seguinte fluxo:

1. Alguém solicita o reembolso preenchendo informações como valor de alimentação, taxi, etc. 
2. Esta solicitação cai para a aprovação de um gestor.
3. Aprovação 
    1. Se reprovado, o chamado é encerrado
    2. Se aprovado, o chamado é encaminhado para a fila de tesouraria para Pagament
4. Após o pagamento, o chamado é fechado e um novo chamado é criado para área de contabilidade fazer o lançamento no sistema contábil.

### Compos Dinâmicos 

Normalmente o desenho de work flows faz sentido a medida que automatizamos a obtenção e processamento de informcões. Work flows para "Processos de Reembolso",  "Requisição de Compras" etc normalmente requerem o registro de informções que não existem por padrão no mecanismo de ticket do Ligero Smart, tais como "Valor de Táxi", "Valor Alimentação" etc. por isso, o ponto de partida que recomendamos para a paremetrização de processos é a definição e acriação de campos dinâmicos para o mesmo.

Neste exemplo, utilizaremos os seguintes campos dinâmicos:  
> * Quilometragem rodada (reeQuilometragem), no objeto chamado, tipo texto.  
>> * Se preferir, adicione uma expressão regular nas configurações do campo, para aceitar apenas números no campo.  
* Valor Pedágio (reePedagio), no objeto chamado, tipo texto.  
* Valor Táxi (reeTaxi), no objeto chamado, tipo texto.  
* Valor Avião/Onibus (reeAviao),no objeto chamado, tipo texto.  
* Valor Alimentação (reeAlimentação), no objeto chamado, tipo texto.  
* Valor Hospedagem (reeHospedagem), no objeto chamado, tipo texto.  
* Status Reembolso (reeStatus), no objeto chamado, tipo Dropdown, valores "Aprovação Pendente", "Aprovado" e "Rejeitado".  

__Importante:__ Faça a liberação destes campos dinâmicos na tela "Frontend::Customer::Ticket::ViewZoom"

Também é necessário liberá-los no subgrupo de parâmetros "Frontend::Agent::Ticket::ViewZoom" que está dentro de *Administração -> ProcessManagement*.

No parâmetro Tiket::Frontend::AgentTicketZoom###PrcessWidgetDynamicField adicione todos os campos que utilizaremos no processso:

img

__Além disso, para este nosso exemplo, precisamos de três filas novas no sistema:__

* Gestores 
* Tesouraria
* Contabilidade

Crie as filas acimas antes de prosseguir.

Com os campos dinâmicos e filas criados, podemos então __criar o processo__.

Acesse *Administração -> Gerenciamanto de Processos*

Clique em "Criar Novo Processo. Nomeie este Processo, dê uma descrição e marque seu estado como "Ativo".

__*Atividades*__

Podemos entender as atividades como passos de cada processo. Verifique o nosso processo exemplo de reembolso abaixo:

img

Este processo simples é composto por 4 atividades:

* Preenchimento do Formulário de Reembolso, que é executado pelo cliente.
* Análise e Aprovação, que será executado por um gestor.
* Pagamento, que será executado pela tesouraria.
* Fim do processo. (neste momento, um outro chamado é criado para outra área, a de contabilidade).
  
Crie 4 atividades descritas acima, clicando em *"Atividades"-> "Criar Nova atividade"*.
Por enquanto, apenas dê o nome à atividade e clique em "Enviar".


*Apenas para informção*  
> * Cada elemento possui um código de identificação (exemplo: *Activity-736cb0a14b6a1ac160067af4bec5b57e*) que é conhecido como EntityID.
* As atividades ão conectadas pelas transições. Veremos adiante como criaá-las e utilizá-las para interligar as atividades.

Arraste as 4 Atividades criadas para o painel posionando de forma semelhante a disposição dos elementos na imagem abaixo:

img

__*Janelas de Atividade*__

Janelas de Atividade são telas de interação que podemos disponibilizar em cada atividade do processo. Cada atividade deve possuir uma ou mais Janelas de Atividades (exceto a atividade "Fim do Prcesso" de nosso exemplo).

Nas janelas de atividade, dispomos os campos dinâmicos que queremos que sejam preenchidos em cada momento do processo. Na prática, é lá que ocorre a interação do atendente ou cliente com o chamado de processo.

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

O campo "Disponível em" define onde esta janela de atividade estará disponível, se apenas na interface de atendentes ou clientes ou se em ambas. Neste caso,estará nas duas interfaces pois o cliente também poderá solicitar o reembolso diretamente através de sua interface, por isso escolha "Agent and Customer Interface".

No campo "Descrição Curta" você pode repetir o nome da janela de atividade.

No campo "Descrição Longa" é opcional.

O campo "Permissões" define qual a permissão necessária para se enxergar esta tela, de acordo com a fila onde o chamado se encontra no momento em que o processo do mesmo está na atividade atual.
Por exemplo, se você definir "Leitura e Escrita" e o chamado estiver na fila "Tesouraria", apenas atendentes com permissão "Leitura e Escrita" nesta fila terão acesso a esta janela de atividade.

O campo "Requer Bloqueio" define se para acessar esta tela, será necessário ser o proprietário do chamado e bloqueá-lo. Se você definir sim, apenas o proprietário do chamado terá permissão de acessar a tela, ou qualquer atendente da fila no caso do chamado estar desbloqueado. Para nosso exemplo, defina "Sim".

Em "Submit Advice Text" você pode configurar uma dica que é exibida ao lado do botão de submissão do formulário.

Em "Submit Button Text" você pode alterar o texto padrão ("Enviar") do botão de submissão do formulário.

Agora precisamos colocar os campos que serão exibidos ou trabalhados nesta tela.

Esta será a tela inicial do processo, visto que colocaremos  ela como primeira janela de atividade, primeira atividade do mesmo, por isso, será necessário também alguns campos além dos campos do preciso que definimos acima, conforme veremos a seguir. Arraste os seguintes campos da caixa "Campos Dsiponíveis" para a caixa "Campos Atribuídos", ao arrastar, o sistema solicitará algumas informações que também explicaremos a seguir:  
> * Arraste o campo campo ID do Cliente  
    * A tela "Editar Detalhes do  Campo Customer ID" é exibida. Mantenha os valores padrão e clique em *Salvar*.  
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
Finalmente clique em *"Enviar"*.  

Agora clique e arraste o "Formulário de Reembolso" para dentro da atividade "Preenchimento do Formulário de Reembolso".

img

Se tudo deu certo, ao passar o mouse em cima da atividade "Preenchimento do Formulário de Reembolso", você verá que a janela de atividade "Formulário de Reembolso" está dentro da mesma, como na figura a seguir:

img

Vamos criar agora uma janela "__Solicitar Aprovação__":

* Adicione uma nova janela de atividade que será disponível para o cliente e atendente
* permissão Leitura e Escrita 
* Bloqueio requerido
* Inclua apenas o campo __reeStatus__
* Arraste também esta janela recém-criadas para a atividade "Preenchimento do Formulário de Reembolso".

Agora vamos criar uma janela "__Aprovação__" que deverá ser incluída na atividade "Análise e Aprovação". Adicione uma nova janela de atividade que será disponível para atendente apenas, permissão de Leitura e Escrita, Bloqueio requerido e inclua apenas campos:

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

__*Transições*__

As transições são fundamentais para o funcionamento do processo. Elas são as conexões entre as atividades do processo. Funcionam como gatilhos para levar o chamado para uma nova atividade ou outra de acordo com  condições que podemos determinar.

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

Podemos inserir uma condição apenas para nosso gatilhados ou várias condições combinadas. O campo "Tipo de Ligação Entre as Condições" determinada que tipo de relação lógica deve prevalecer no caso de utilizarmos mais que uma condição. Se você está trabalhando apenas com uma condição, não precisa se preocupar com isto, caso contrário, você precisa entender os tipo: 

* E - Todas as condições precisam ser verdadeiras para que a transição ocorra 
* Ou - A transição ocorre caso qualquer uma das condições definidas seja verdadeira
* xor - A transição ocorre se apenas uma condição das várias definidas for verdadeira.

Possuímos dois níveis de condiçãoes, o que nos permite criar condições multiplas combinadas, por exemplo:

Se ((Prioridade = Alta __e__ Tipo = Incidente) __ou__ (Prioridade = Muito Alta __e__ Tipo = Incidente)) ou a mesma regra configurada de outra maneira:  
Se ((Tipo = Incidente) __e__ (Prioridade = Muito Alta __ou__ Prioridade = Muito Alta))  

Em seguida, temos que definir o nome do campo do chamado que será analisado.

Podemos trabalhar com os seguintes valores (principais):  
> * Title
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

* String: Verifica se o valor do campo é exatamente o digitado;
* Regexp: faz uma verificação utilizando expressão regular;
* Transition Validation Module: trata-se de uma maneira mais avançada de gatilhar a transição, chamando um módulo perl externo, que pode realizar cáculos mais avançados ou mesmo consultar informações em outros sistemas externos para então gatilhar a transição entre atividades.

Neste nosso exemplo, queremos criar a transição "Aprovação Pendente" que verifica o campo reeStatus (DynamicField_reeStatus). O preenchimento da tela ficaria desta forma:

img

Realize então o cadastro desta transição e clique em *Enviar*.

Agora que criamos a transição vamos conectá-la às atividades. Clique e arraste a transição para a atividade de origem, neste caso "Preenchimento do Formulário de Reembolso" e solte. O desenho ficará asim:

img

Agora clique na bolinha vermelha na ponta da transição (a cor da linha deve mudar para amarelo) e arraste até a atividade "Análise e Aprovação", até que a mesma fique com a borda amarela, e solte o botão do mouse. Deverá ficar assim:

img

OK! Vamos criar agora as demais transições:

img

__Importante:__ se você nào traduziu manualmene os estados padrões do seu sistema no menu *Administração -> Estados,* você deverá inserir o nome do estado em inglês, conforme está cadastrado no sistema.

Conecte as demais transições criadas conforme a figura a seguir:

img

### Ações de Transição 

Uma vez que conectamos todas as atividades utilizando as transições, podemos definir ações que são executadas no chamado quando uma transição entre atividades ocorrer.

Em nosso exemplo, vamos realizar as seguintes ações quando cada transição abaixo ocorrer:  
> * Aparovação Pendente
  * Mover chamado para fila Gestores
* Reembolso Rejeitado 
    * Mover chamados para a fila Tesouraria 
    * Fechar chamado com êxito
* Aprovado 
    * Mover chamado para fila Tesouraria 
* Chamado Encerrado
    * Criar um novo chamado para a fila Contabilidade, solicitando a conciliação cotábil

Note que a ação "Mover chamado para fila Tesouraria" é comum a duas transições.  
__Vamos criar as ações.__ Clique em *Ações de Transição -> Criar Nova Açào de Transição*.  
Primeiramente defina o nome da ação. Vamos começar com a "Mover chamado para fila Gestores".  
As ações de transição utilizam módulos para executar suas atividades. Neste exemplo, vamos utilizar o módulo __TicketQueueSet__ que altera o chamado de fila (adiante explicaremos a função de outros módulos).  
Em Parâmetros de Configuração, no campo "Chave" digite "__Queue__" (sem aspa). Em "Valor" digite "Gestores" (sem aspas):

img

Clique em *Enviar*

Vamos criar a ação "Mover chamado para a fila Tesouraria" que utiliza o mesmo módulo TicketQueueSet:

img

Agora vamos criar a ação "Fechar chamado sem êxito". Para isso, vamos usar o módulo TicketStateSet:

img

Note que o parâmetro "Chave" colocamos o valor "State" e no parâmetro "Valor" colocamos o nome do estado. Se você não introduziu os estados padrões do Ligero Smart, coloque "closed unsuccessful". 

Finalmente, vamos criar uma transição para __realizar a criação de um novo chamado na fila Contabilidade__, quando o processo de reembolso for encerrado.

Crie uma nova ação de transição com o nome "Novo Chamado - Contabilidade" 

Escolha o módulo da Ação de Transição "TicketCreate"

Vamos preencher os seguinte "Parâmetros de Configuração":

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg .tg-xldj{border-color:inherit;text-align:left}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
</style>
<table class="tg">
  <tr>
    <th class="tg-xldj"><strong>Chave</th>
    <th class="tg-xldj"><strong>Valor</th>
  </tr>
  <tr>
    <td class="tg-xldj">ArticleType</td>
    <td class="tg-xldj">note-external</td>
  </tr>
  <tr>
    <td class="tg-xldj">Body</td>
    <td class="tg-xldj">Realizar lançamento contábil&lt;br/&gt;&lt;br /&gt;Valor Deslocamento:<br>&lt;Ligero_Ticket_DynamicField_reeAviao&gt;&lt;br /&gt;Valor Pedagio:<br>&lt;Ligero_Ticket_DynamicField_reePedagio&gt;&lt;br /&gt;Valor Táxi:<br>&lt;Ligero_Ticket_DynamicField_reeTaxi&gt;&lt;br /&gt;Quilometragem:<br>&lt;Ligero_Ticket_DynamicField_reeQuiometragem&gt;&lt;br /&gt;Valor Hospedagem:<br>&lt;Ligero_Ticket_DynamicField_reeHospedagem&gt;&lt;br /&gt;Valor Alimentação:<br>&lt;Ligero_Ticket_DynamicField_reePadegio&gt;&lt;br /&gt;</td>
  </tr>
  <tr>
    <td class="tg-0pky">ContentType</td>
    <td class="tg-0pky">text/html; charset=UTF-8</td>
  </tr>
  <tr>
    <td class="tg-0pky">CustomerID</td>
    <td class="tg-0pky">&lt;Ligero_Ticket_CustomerID&gt;</td>
  </tr>
  <tr>
    <td class="tg-0pky">CustomerUser</td>
    <td class="tg-0pky">&lt;Ligero_Ticket_CustomerUserID&gt;</td>
  </tr>
  <tr>
    <td class="tg-0pky">HistoryComment</td>
    <td class="tg-0pky">Novo Chamado</td>
  </tr>
  <tr>
    <td class="tg-0pky">HistoryType</td>
    <td class="tg-0pky">AddNote</td>
  </tr>
  <tr>
    <td class="tg-0pky">LinksAs</td>
    <td class="tg-0pky">Child</td>
  </tr>
  <tr>
    <td class="tg-0pky">Lock</td>
    <td class="tg-0pky">unlock</td>
  </tr>
  <tr>
    <td class="tg-0pky">OwnerID</td>
    <td class="tg-0pky">1</td>
  </tr>
  <tr>
    <td class="tg-0pky">Priority</td>
    <td class="tg-0pky">3 normal</td>
  </tr>
  <tr>
    <td class="tg-0pky">Queue</td>
    <td class="tg-0pky">Contabilidade</td>
  </tr>
  <tr>
    <td class="tg-0pky">SenderType</td>
    <td class="tg-0pky">agent</td>
  </tr>
  <tr>
    <td class="tg-0pky">State</td>
    <td class="tg-0pky">new</td>
  </tr>
  <tr>
    <td class="tg-0pky">Subject</td>
    <td class="tg-0pky">Lançamento Contábil</td>
  </tr>
  <tr>
    <td class="tg-0pky">Title</td>
    <td class="tg-0pky">Lançamento Contábil</td>
  </tr>
</table>

Veja como fica:

img

Mais adiante neste documento, você encontra a referência de todos os parâmetros posssíveis para a utilização em cada ação de transição.

__Agora arraste as ações de transição para dentro das respectivas transições.__

Clique em "*Salvar e Finalizar*"

__*Executando e ajustando o processo criado*__

Agora clique em "Sncronizar Todos os Processos".

img

Acesse a interface de cliente e faça login.

Acesse *Chamado -> Novo Chamado via Processo*

img

Escolha "Processo de Reembolso", preencha o formulário e clique em *Enviar*.

img

Veja como fica a tela do chamado na interface do cliente após a criação do mesmo:

img

Note que na caixa "Informação" temos os campos dinâmico que foram preenchidos. Veja que o mesmo se encontra na fila "Tesouraria" conforme configuramos. Também verificamos o nome do processo e ao atividade na qual o mesmo se encontra neste momento.

Logo abaixo, na caixa "Próximos Passos", temos as Janelas de Atividades que estão disponíveis para esta atividade e liberadas para o cliente.

Clique em Solicitar Aprovação:

img

Veja que as opções de aprovação do chamado estão disponíveis para o cliente, mas não queremos isso não é mesmo?

Vamos restringir a exibição apenas do valor "Aprovação Pendente". Para isto, crie ACL como a seguir:

img

Note que "AtctivityDialog-52ad1761ae0e17018871aa3931849613" é o código da janela Aprovação Pendente de atividade. Verifique qual é o código da sua ActivityDialog e coloque no lugar.

Clique nvamente em *Solicitar Aprovação*. Agora apenas o valor Aprovação Pendente estará disponível.
Clique em enviar, e agora o chamado ficará com essas características.

img

Note que a fila automaticamente mudada para "Gestores" e a atividade agora é "Análise e Aprovação" e não há mais janelas disponíveis para o cliente neste momento do processo.

Vamos verificar como o mesmo chamado é visualizado pelos atendentes neste momento:

img

Note que as variáveis do processo estão sendo exibidas na caixa "Informações do Processo" abaixo de "Fields with no group". Vamos melhorar isso! Vamos criar três agrupamentos de informações, o primeiro para agrupar os valores de deslocamento, o segundo para agruparos valores de hospedagem e alimentacão e o último para o campo status.

Isso é feito em *Administração -> Configuração do Sistema -> ProcessManagement -> Frontend::Agent::Ticket::ViewZoom*

Altere o parâmetro ProcessWidgetDynamicFieldGroups para que fique desta maneira:

img

Recarregue a tela do chamado na interface do atendente e veja a diferença.

Seguindo o processo, clique no botão "Aprovação". A tela a seguir aparecerá:

img

Justifique sua decisão e a defina no campo Status Reebolso.

Se você definir Rejeitado, o chamado ficará com as seguintes características:

img

Note que o estado do chamado agora é "fechado sem êxito", foi enviado novamente para a fila Tesouraria e o estado do reembolso agora é "Rejeitado".

Se você escolher "Aprovado", o chamado seguirá para a próxima etapa (Atividade Pagamento) e será direcionado para a fila Tesouraria novamente.

Neste momento, __o botão "Efetuar Pagamento" fica disponível para os atendentes da fila Tesouraria. Clique nele!__

Nesta tela, vamos adicionar informações sobre o pagamento no campo artigo e escolheremos o estado "fechado com êxito". Note no entanto que neste momento todos os estados estão visíveis aqui:

img

Vamos então criar uma ACL para que apenas o estado "fechado com êxito" apareça. Ela deverá ser assim:

img

Altere o nome do estado de acordo com seu sistema. Também, altere o ActivityDialogEntityID de cordo com o seu sistema.

Atualize a tela "Efetuar Pagamento" e agora você verá apenas o estado "fechado com êxito". Preencha o artigo e clique *Enviar*.

O chamado é direcionado então para a atividade "Fim do Processo".

Neste momento, um novo chamado é criado na fila Contabilidade. Note que ele fica associado como Filho no chamado do processo de reembolso.

img

Acesse o novo chamado e perceba que os valores preenchidos no chamado anterior foram transportados para o campo "Body" do novo chamado.

img

### Anexo 1: Módulos de Transição

Aqui temos a lista de módulos de transição e seus parâmetros

*DynamicFieldSet*  
Altera o valor de um campo dinâmico do chamado.

| __Chave__      | __Valores Possíveis__ |
|----------------|-----------------------|
| CampoDinamico1 | Valor do Campo        |
| CampoDinamico2 | Valor do Campo        |

*TicketArticleCreate*

Cria um artigo no chamado

| __Chave__                   | __Valores Possíveis__                                                                                          |
|-----------------------------|----------------------------------------------------------------------------------------------------------------|
| __Obrigatórios__             |                                                                                                                |
| ArticleType                 | note-external/note-internal/phone/fax/sms...                                                                   |
| SenderType                  | agent/system/customer                                                                                          |
| ContentType                 | text/plain; charset=ISO-8859-15                                                                                |
| Subject                     | Assunto do Artigo                                                                                              |
| Body                        | Corpo do Artigo                                                                                                |
| HistoryType                 | OwnerUpdate/EmailCustomer/Move/AddNote/PriorityUpdate/WebRequestCustomer/...                                   |
| HistoryComment              | Comentário livre para o histórico do chamado                                                                   |
| __Opcionais__               |                                                                                                                |
| From                        | Some Agent <email@example.com>                                                                                 |
| To                          | Some Customer A <customer-a@example.com>                                                                       |
| __Cc__                      | Some Customer B <customer-b@example.com>                                                                       |
| ReplyTo                     | Some Customer B <customer-b@example.com>                                                                       |
| MessageID                   | <asdasdasd.123@example.com>                                                                                    |
| InReplyTo                   | <asdasdasd.12@example.com>                                                                                     |
| References                  | <asdasdasd.1@example.com><asdasdasd.12@example.com>                                                             |
| NoAgentNotify               | Define se queremos evitar a notificação de usuários. O padrão é 0. Coloque 1 se desejar cancelar notificações. |
| AutoResponseType            | auto reject/auto follow up/auto reply/new ticket/auto remove                                                   |
| ForceNotificationToUserID   | Ids dos usuários que se deseja forçar uma notificação, separados por vírgula                                   |
| ExcludeNotificationToUserID | Ids dos usuários que nã se deseja notificar, separados por vírgula                                             |

*TicketCustomerSet*  
Define um novo cliente ou uma nova empresa parao chamado.

| __Chave__      | __Valores Possíveis__              |
|----------------|------------------------------------|
| CustomerID     | Client123 (Código da Empresa)      |
| CustomerUserID | Client-user-123 (Login do Cliente) |

*TicketLockSet*  
Bloqueia ou desbloqueia o chamado

| __Chave__ | __Valores Possíveis__                             |
|-----------|---------------------------------------------------|
| Lock      | lock (para bloquear) ou unlock (para desbloquear) |

*TicketOwnerSet*  
Define um atendente como proprietário do chamado.  
Apenas uma das chaves abaixo é necessária. 

| __Chave__ | __Valores Possíveis__ |
|-----------|-----------------------|
| Owner     | Login do Atendente    |
| OwnerID   | ID do Atendente       |

*TicketQueueSet*  
Altere a fila do chamado
apeas uma das chaves é necessária.

| __Chave__ | __Valores Possíveis__ |
|-----------|-----------------------|
| Queue     | Nome da Fila          |
| QueueID   | ID da Fila            |

*TicketResponsibleSet*  
Define o responsável do chamado.  
Apenas uma das chaves abaixo é necessária.

| __Chave__   | __Valores Possíveis__ |
|-------------|-----------------------|
| Responsible | Login do Responsável  |
| Responsible | ID do Responsável     |

*TicketServiceSet*  
Define o serviço do chamado.  
Apenas uma das chaves abaixo é necessária.

| __Chave__  | __Valores Possíveis__ |
|------------|-----------------------|
| Service    | Nome do Serviço       |
| ServiceID  | ID do Serviço         |

*TickeySLASet*  
Define o SLA do chamado.  
Apenas umas das chaves abaixo é necessária.

| __Chaves__ | __Valores Possíveis__ |
|------------|-----------------------|
| SLA        | Nome do SLA           |
| SLAID      | ID do SLA             |

*TicketStateSet*  
Define o estado do chamado.  
Apenas uma das chaves abaixo é necessária.

| __Chave__ | __Valores Possíveis__ |
|-----------|-----------------------|
| State     | Nome do estado        |
| StateID   | Id do estado          |

*TickeTitleSet*  
Define o título do chamado.

| __Chave__ | __Valores Possíveis__ |
|-----------|-----------------------|
| Title     | Título do Chamado     |

*TicketTypeSet*  
Define o Tipo do Chamado.  

Apenas uma das chaves abaixo é necessária.

| __Chave__ | __Valores Possíveis__ |
|-----------|-----------------------|
| Type      | Nome do Tipo          |
| TypeID    | ID do Tipo            |

*TicketCreate*  
Cria um novo chamado, um artigo (opcional) e associa com o chamado originário (opcional).

| __Chave__      | __Valor__                                         |
|----------------|---------------------------------------------------|
| Article        | Tipo de artigo                                    |
| Body           | Corpo do artigo                                   |
| ContentType    | Tipo do Conteúdo: text/html; charset=UTF-8        |
| CustomerID     | ID da empresa do cliente                          |
| CustomerUser   | ID do cliente                                     |
| HistoryComment | Comentário de Histórico, texto livre              |
| HistoryType    | Tipo de Histórico (AddNote, TicketCreate etc)     |
| LinkAs         | Child ou Parent                                   |
| Lock           | unlock ou lock                                    |
| OwnerID        | ID do Proprietário                                |
| Priority       | 1 very low, 2 low, 3 normal, 4 high, 5 very high  |
| Queue          | Nome da Fila                                      |
| SenderType     | agent ou customer                                 |
| State          | Estado do Chamado                                 |
| Subject        | Título do Artigo                                  |
| Title          | Título do Chamado                                 |

