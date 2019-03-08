## Estatísticas e Relatórios 

### Estatísticas 

O módulo de estatística do Ligero Smart possui recursos para gerar relatórios personalizados. A configuração adequada deste módulo permite um rico apaio em tomadas de decisão.

Para iniciar o uso da estatística, vamos acessar no Toolbar a opção ESTATÍSTICA, como mostra a imagem  abaixo:

img

__Visão Geral:__ Mostra os relatórios padrões do Ligero Smart e os adicionados por usuários do sistema.
__Nova:__ Permite a criação de novos relatórios. 
__Importar:__ Importar novos relatórios com o módulo do prórprio Ligero.

img

Em visão geral, temos o número da estatística, título,  objeto usado na criação do relatório.

### Gerando Relatórios

Antes de aprender a criar relatório, vamos gerar um que vem junto a instalação do Ligero Smart.
Para isto, na "Visão Geral: Estatística", clique na estatística número 10003.

img

Na tela de extração do relatório, existem os botões ao lado esquerdo, que nos permitem voltar para a Visão Geral, executar o relatório 10003 no caso.

Temos também as configurações que foram selecionados quando criamos o relatório. Não se preocupe com todos esses campos detalhados.

### Criação de Relatórios

Para criar um novo relatório agora temos que selecionar o tipo de estatística que queremos. Temos 3 tipos disponíveis:

Estatística de Tabela Dinâmica (Dynamic Matrix Statistics)

img

Este tipo de estatística irá gerar uma tabela de valores calculados (Ex.: Novos Tickets por dia do mês e filas). Todos os valores das cédulas na tabela possuem o mesmo tipo (número, tempo médio, etc.). Os valores são calculados de entidades no sistema (Ex.:Tickets). Algumas estatísticas suportam a soma das colunas e/ou linhas (somente alguns tipos de dados).

Estatística de Lista Dinâmica (Dynamic List Statistics)

img

Este tipo de estatística irá gerar uma tabela onde cada linha (e não cédula) representa uma entidade no sistema (Ex.: Um ticket). As colunas nesta linha são geralmente configuráveis (eixo - x) e contêm os dados deste objeto (Ex.: atributos do ticket). Todas as cédulas de valor em uma coluna tem o mesmo tipo.

Estatísticas Estáticas (Static Statistics)

img

Este tipo de estatística não é muito configurável e geralmente usado pra cálculos complexos.

A tela seguinte chama-se "Editar: Estatística N.", onde você pode editar ou criar um relatório. Daremos inicio explicando os três primeiros campos desta tela.

img

__Título:__ Definição de um nome para este relatório.

__Descrição:__ Um complemento para auxiliar o atendimento no relatório. Pode conter informações do que o relatório retorna e para qual finalidade foi elaborado.

__Dynamic-Object:__ Quando uma isntalação do Ligero Smart é feita, por padrão vem quatro tipos de relatórios, vamos explicar cada um deles:

1. Acumulação de chamados: Este tipo de relatório retorna uma sumarização dos chamados de acordo com os filtros escolhidos. Por exemplo, se filtramos para ver todos os chamados fechados do mês de julho, ele nos retornará os chamados fechados no dia 1, 2, 3, 4 até o dia 31, quantos chamados por dia foram fechados. Podemos também extrair este mesmo relatório no período de 1 ano e escolher para nos trazer com a escala mensal, então ele retornaria todos os chamados fechados de Janeiro, Fevereiro, Março até Dezembro.
2. Lista de Chamados: Retorna uma listagem de chamados com os filtros configurados, ou seja, posso configurar para listar todos os chamados resolvidos por um atendente ou todos os chamados abertos na última semana, contendo informações como SLA, Serviço, Atendido dentro do SLA ou fora, data de criação, data de fechamento entre outros campos.
3. Tempo de Contabilizado do Chamado: Este relatório traz a quantidade de tempo que foram preenchidas no chamado. Esta informação é retirada do campo Unidade de Tempo (em minutos) na tela de resposta ou da Nota. Podemos fazer um filtro com horas contabilizadas de cada atendente, filtrar por cliente e serviço ou outra configuração mais adequada para seu tipo de negócio.
4. Ticket Solution Response Time: Este relatório tem a função de nos trazer informações como tempo médio de atendimento, tempo mínimo e máximo. Dependendo do filtro escolhido ele retorna o tempo médio, mínimo e máximo de atendimento de cada serviço por atendente ou uma relação de fila x serviço/atendente. Entraremos em mais detalhes na elaboração destes relatórios.

Os próximos  campos definem permissões e como esse relatório será exibido:

Permissões: Define quem terá direito no relatório. Quem poderá extrair ou editar o mesmo, contando com as configurações de permissões dos grupos.

img

Formato do Resultado: Nesse campo definimos como e com qual formato o relatório vai ser extraido. Existem algumas opções de gráficos e mais o CSV e "Imprimir" que é extraido em PDF.

Tamanho do Gráfico: Define o tamanho para os gráfico extráidos. Tabalha em conjunto com o Formato do Resultado.

Somar Linhas: No final do relatório, pode-se somar linhas.

Somar Colunas: No final do relatório, pode-se somar as colunas.

Usar Cache: O cache armazena as pesquisa feitas no banco de dados, para que futuramente não precise fazer a mesma consulta novamente.

### Linhas do Chamado

Vamos simular um relatório de lista de chamado. Todos os dados presentes neste relatório são fictícios.
Esta relatório será dos chamados abertos no sistema.
Para dar início ao novo relatório, basta seguir *Estatísticas->Adicionar*.
Selecione o tipo da matriz, estatística de lista dinâmica.
Defina um título e descrição para este novo relatório.
No caso, vamos chamar de "Chamados Abertos" e a descrição "Chamados Abertos no sistema".
Em Dynamic_Object, selecione *Lista de Chamado*.
Clique em *Salvar*.

No passo 2, você deverá escolher escolher quais os campos aparecerão no relatório, selecionando o eixo - x, conforme imagem abaixo: 

img

Selecione os campos de Ticket, Idade, Titúlo, Criado, Alterado, Fila, Estado. Clique em *Salvar* para seguir a diante.

img

Escolha quais campos serão ordenados e a sequência, selecionando o eixo - y, conforme imagem abaixo:

img

Em seguida, escolha como você gostaria de ordenar os chamados, ou seja, escolha se é crescente ou decrescente, por qual atributo vai ser ordenado. Normalmente ordenamos pelo Ticket#.

img

Vcê verá que  retorá todos os chamados abertos no sistema.

### Acumulação de Chamados

Para criar um relatório de Acumulação de Chamados, inicie o procedimento, conforme o anterior usando estatística de matriz dinâmica.

Insera o nome e a descrição, no Dynamic-Object escolha Acumulação de chamados. Nessa simulação, exporte quantos chamados cada atendente possui, ou seja, quantos chamados cada atendente possui bloqueados.

Antes de fazer esse relatório, abra uma nova guia no navegador e navegue até *Administração -> Configuração do Sistema*. No listbox escolha Framework. Localize a opção de configuração Frontend::Agent::Stats. Localize o Argumento Stats::UsegentelementStats. Altere essa configuração para "SIM". Em seguida, clique em *Atualizar*.

Essa opção vai habilitar a opção de escolher proprietário do chamado nos relatórios.

O campo __Exibir como componente no painel de controle:__ coloque como SIM. Com ela, será possível exibir essa pesquisa em forma de Gráfico no Painel de Controle.
Após essa modificação, volta para a tela de criação do relatório.
Clique no eixo - X
Adicione o atributo estado, em seguida o estado desejado.

Selecionando o Atendente/Proprietário para exibir o relatório, clique no eixo - y, adicione o atributo Atedente/Proprietário, em seguida o Atendente desejado. 
Na etapa 3, selecione o campo *Estado* e selecione todos os itens.

img

Clique em *Filtro* adicione o atributo *Hora de Criação*, conforme a imagem abaixo:

img

Desmarque o "Do not allow changes to this element when the statistic is generated." e ajuste a data para -------. Com isso, quando extrair esse relatório futuramente, podemos alterar as datas.

Clique em *Salvar* e em seguida *Salvar e Finalizar*.

O retorno deste relatório fica da seguinte maneira:

img

Exclua a coluna com Admin Ligero para falicitar a visualização.
Para habilitar este relatório como gráfico no Painel de Controle, clique em *Painel de Controle*. Expanda o menu Configurações no canto direito da tela e selecione o gráfico criado, conforme imagem abaixo.

Após selecionado, o Ligero Smart, tem o tempo de geração desse gráfico de 10 minutos para carregar as informações.
Ao carregar, o gráfico é exibido desta forma:

img

### Tempo Contabilizado de Chamado

Nesse exemplo, vamos calcular o total de tempo trabalhado por uma determinada equipe, no caso, as equipes são divídidas em filas. Suporte::Hardware, Suporte::Software, Suporte::Sistemas.

Na teala de criação da Esatísticas, em Dynamic-Object, selecione o Tempo Contabilizadode Chamado/ TicketAccountdTime.
Clique em salvar, selecione o eixo - x, adicione o atributo fila, em seguida as filas desejadas conforme imagem abaixo:

img

Selecione o eixo - y, adicione o atributo Atendente/Proprietário, em seguida os atendentes desejados conforme imagem abaixo:

img

Vamos restringir o gráfico para a hora de criação.

Selecione a opção filtro, adicione o atributo Horário de Criação do Chamado, em seguida coloque a data conforme imagem abaixo:

img

Clique em *Salvar* e em seguida *Salvar e Finalizar*.

Finalize o relatório e extraia o mesmo.
O retorno deste relatório ficará da seguinte maneira:

img

Podemos ver quais foram as ocupações de cada análista no decorrer  do dia.

### Ticket Solution Response Time

O último reatório padrão do Ligero Smart apresenta algumas funções interessantes. Vamos criar um teste para entendermos melhor o que faz.
Crie um relatório Lista Dinâmica com um nome e descrição e escolha o Dynamic-Object TicketSolutionResponseTime e clique em *Salvar*.
Selecione o eixo - x, adicione o atributo Avaliado, em seguida os valores conforme imagem abaixo:

img

Na etapa 2, selecione o eixo - y, adicione o atributo "Criado na Fila" e "Atedente/proprietário", conforme imagem abaixo:

img

Na etapa 4, de resttrições, vamos executar sem nenhuma,porém, podemos restringir por data de criação ou fechamento entre outras opções.

Finalize o relatório e extraia. Ficará da seguinta maneira:

Esse relatório nos mostra o tempo médio, máximo e mínimo que cada analista trabalhou em cada fila. Realizando restrições, esse relatório consegue trazer informçõe mais robustas ou mais simples.

Solution Averege é o tempo médio que o analista levou para atender os chamados de cada fila.

Solution Min Time: Tempo mínimo de um chamado de respectiva fila.

Solution Max Time: Tempo máximo deum chamado da respsctiva fila.

Para mais informações, acesse o link abaixo:

------??



