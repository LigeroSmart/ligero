## Glossário Help Desk

### Chamados ou Tickets

Um chadado (ou ticket como tamém é conhecido), é o mecanismo usado pelo Ligero Smart para controlar a comunicação e resolução de probelmas dos clientes. Um chamado pode ser criado pelos clientes através do portal de atendimento ou atendente quando recebe uma slicitação de um cliente por telefone.

### Artigos 

Para cada integração de um atendente ou deum cliente (solicitante) com um chamado é registrado um artigo, ou seja, um artigo é qualquer forma de comunicação interna ou externa relacionadas a um chamado. Um artigo pode ser registrado diretmente no corpo do chamado na forma de um e-mail, telefonema, nota interna, ou atualização de chamado.

### Estado do chamado, estados ou status

Definem a situação em que se encontra o chamado. Vejamos os estados configurados em nosso sistema.

#### Novo
Os chamados recém criados ficam neste estado até que haja uma primeira interação do atendente com o mesmo.

#### Aberto  
Após a primeira interação, o chamado fica com estado "aberto", que significa que o mesmo está em atendimento.

#### Agrupado (merged) 
Este é o estado de chamados que foram agrupados com outros chamados.

#### Fechado com solução de contorno
O atendente do Service Desk deve escolher este estado quando souber que o chamado foi encerrado com uma solução não definitiva, ou seja, não resolvemosa raiz do problema. Este também é conhecido como Solução Paliativa.

#### Fechado com êxito
Este é o estado final de tickets que foram resolvidos com êxito. Dependendo da configuração, você pode ou não ser capaz de reabrir tickets fechado.

#### Lembrete de pendente
Quando o tempo determinado no campo "Data de Pêndencia" for atingido, o dono do chamado reeberá um e-mail de lembrete sobre o mesmo. Lembrete de chamado só serão enviados durante o horário comercial, e são repetidamente enviados a cada 24 horas até que o estado do chamado seja alterada pelo agente.

#### Pendente auto fechamento -
Tickets neste status serão definidos como "Fechado sem êxito" se o tempo de espera determinado em "Data de Pêndencia" for atingido. Tempo gasto pelo bilhete neste estado continua a contar para fins de escalonamento.

#### Pendente ou fechamento +
Tickets neste status serão definidos como "Fechado com êxito" se o tempo de espera determinado em "Data de Pêndencia" for atingido.Tempo gasto pelo bilhete neste estado continua a contar para fins de escalonamento.

#### *Sugestões*

#### Aguardando Aprovação 
Este estado é atribuído aos chamados que aguardam aprovação de um decisor da organização. Pode trabalhar em conjunto com módulo de Pausa de SLA.

#### Em verificação de Eficácia
Os chamados fcam neste estado logo após voltarem de uma fila de Segundo Nível para o Service Desk devem verificar e eficácia destes chamados junto aos cientes.

#### Eficácia negada 
Os chamados entram neste estado quando o solicitante nega a eficácia para o Service Desk, que por sua vez reencaminha o chamado par o segundo nível e aumenta sua prioridade.

#### *Painel de Controle*

É a primeira tela que o atendente exerga após ter feito login no sistema.
Ele permite visualizar os chamados mai recentes, os que estão pendentes ou escalados.

#### *Filas*

Uma fila éuma espécie de "balde" compartilhado entre grupo de atendimento. Neste "balde" o Ligero Smart coloca os chamados novos ou abertos. 
Um atende então pode pegar o chamado deste "balde" e dar seu devido tratamento.

#### *Cliente*

No Ligero Smart, um cliente é qualquer pessoa da organização a quem permitimos gerar chamados. Em outras palavras, cliente é aquele faz a solicitação, o solicitante.

#### *ID do Cliente ou Customer ID*

Código de uma organização, seja ela uma empresa ou um departamento. 
Seve para aglutinar chamados de uma mesma organização de tal forma que membros desta organização possam enxergar os chamados um dos outros ou mesmo para extrair relatórios relativos a estas organizações. em alguns casos, quando não há a necessidade de aglutinar chamados por organização, utilizarmos o próprio lgin ou e-mail do cliente neste campo.

#### *Serviços*

Define aquilo que oferecemos aos clientes através da geração de valor. No Ligero Smart, podemos associar serviços aos chamados, de forma a dar mais precisão ao atendimento que realizamos.

#### *Escalonamento, Chamados Escalados*

No Ligero Smart, chamados escaldos são aqueles que ultrapassam um dos acordos de tempo de atendimento definidos nos SLA's ou nas filas de atendimento.  
Uma vez que o chamado é escalado, ou seja,umdos acordos de tempo não é cumprido, este ficará com o tempo de estouromarcado em vermelho. Além disto, é possível configurar ações e notificações para serem disparados por e-mail ou sms, caso um chamado seja escalado.

#### *Prioridades*

A Prioridade de um chamado nos diz em que ordem este deve ser resolvido, por isso ela é dada pela combinação entre Impacto e Criticidade (urgência). O Ligero Smart permite atribuir prioridade ao chamado numa escala de 1 a 5. Isto pode ajudar os atendentes que consiguirão visualizar melhor o que deve ser resolvido primeiro. Quanto maior a prioridade, mis rápido o chamado deve ser resolvido, ou maior a atenção que se deve dar ao mesmo.

#### *Proprietário do Chamado*

Atendente que está realizando o atendimento atual ao chamado ou que realizouo último atendimento.

#### *Nota, Nota-interna, Nota-externa*

Notas são informações adicionais que inserimos junto a um chamado para registrar nossas atuações no mesmo:
1. Nota-interna - Somente os atendentes tem acesso a essas informações;
2. Nota-externa - Informações compatilhadas com todos, inclusive com o cliente.

#### *Associar Chamados*

Existem alguns casos onde mais que um solicitante reporta um mesmo incidente. Uma troca de tonner de uma mesma impressor, por exemplo, pode ser reportada por mais de um usuário. Neste caso, é uma boa prática agrupar estes chamados (associá-los).

#### *Tempo de Serviço*

O tempo de serviço nos informa quanto tempo hábil temos para resolver um determinado chamado, ou saja, aqui são computadasas horas úteis apenas.

#### *Bloqueio e Desbloqueio de chamados*

Para evitar que dois atendentes interajam com chamado ao mesmo tempo é necessário que um atendente bloqueia (ou capture) o chamado antes de começar o atendimento do mesmo.
Também ao interagirmos com o chamado adicinando uma nota, reclassificando ou realizando alguma outra ação, o Ligero Smart bloqueia o mesmo automaticamente.
Quando movemos o chamado de uma fila para outra, este é automaticamente desbloqueado de forma que os atendentes da nova fila possam dar continuidade ao atendimento.

### *Data de Pendência, estado pendente*

O ligero Smart permite que o atendente agente um lembrete para um determinado chamado, afins de receber uma notificação futura e retomar o atendimento ao mesmo. Isto pode ser útil, por exemplo, quando você precisa esperar uma peça de um fornecedor para dar continuidade a um chamado.

### *Massa, Ação em Massa*

É possível no Ligero Smart realizar algumas ações em vários chamados simultaneamente, tais como agrupá-los, adicionar uma nota comum a todos ou mesmo encerrá-los de uma só vez.

### *Chamados Disponíveis*

São chamados novos ou abertos (em atendimento) que não estão bloqueados por um atendente, ou seja, estão disponíveis para que um atendente possa se apropriar e atender o chamado.

### *Notificações*

São mensagens enviadas ao atendente ou ao solicitante por e-mail. São configuráveis e os atendentes podem escolher recebê-las ou não em seu menu de configuração.

### *Estatísticas*

O Ligero Smart possui um poderoso módulo de relatórios chamado "Estatísticas".

## Glossário ITSM

### *Criticidade*

O impacto apenas não é suficiente para medir a __urgência__ do chamado. Para isto também poderemos utilizar a criticidade.  
Utilizamos __Muito baixo__ quando o incidente não afeta um serviço ligado diretamente ao negócio. Por exemplo, a queda de uma página institucional da Internet.  
Utilizamos __Médio__ quando o incidente afeta um serviço que está ligado ao negócio. Por exemplo, uma impressora de cupom/nota fiscal sem funcionar.  
Utilizamos __Muito alto__ quando o incidente impacta diretamente na imagem ou nos negócios da empresa de forma muito critica. Por exemplo, o sistema de transições fora do ar em uma ou todas as filiais.

### *Impacto*
Define o escopo que um incidente ou problema atinge.  
__Muito baixo__ significa que o incidente ou problema atinge apenas um individuo.  
__Muito alto__ significa que o incidente atinge uma filial, um departamento ou mesmo a empresa toda.

#### *Tipo de chamado*

Este atributo do chamado é utilizado para identificarmos com mais precisão o tipo de solicitação que o cliente está fazendo. Basicamente temos: 

*Não classificados*  
É o tipo padrão do ticket, logo após o mesmo ter sido aberto pelo cliente.

*Incidente*  
Segundo o ITIL, __incidente__ é qualquer evento que não faz parte da operação padrão de um serviço e que causa, ou pode causar, uma interrupção do serviço ou uma redução da sua qualidade. Quando a internet de uma filial cai, uma impressora deixa de funcionar etc e conseguimos identificar a causa imediata, temos então um incidente.

*Problema*   
O __Problema__ éa causa desconhecida de um ou mais incidentes, ou seja, um incidente que não tem sua causa raiz identificada acaba se tornando um problema.
Reincidências de __incidentes__ normalmente tem sua causa raiz identificada acaba se tornando um problema. 
Reincidência de __incidentes__ normalmente tem sua causa em um __problema__ maior.

*Solicitação de Serviço*  
Novas solicitações de um serviço que já prestamos. Por exemplo: adicionar novo usuário aos sistemas.






