## Acess Control Lists - ACL

## Introdução

As ACL's servem para incrementar o sistema de permissões do Ligero Smart. Com elas é possível restringir escolhas de atributos do ticket ou ações possíveis de serem tomadas de acordo com as propriedades atuais do mesmo (fila atual, estado stc).

Atualmente criamos as ACL's com implementação de códigos no arquivo Kernel/Config.pm (recomendado) e não há interface gráfica para isso. Com sua utilização, é possível inclusive implementar pequenos workflows no sistema.

Vejamos um exemplo de ACL escrita em arquivo de configuração que restringe um chamado de prioridade alta (5) para que seja permitido movê-loapenas uma fila chamada alerta:


    # ticket acl
    $Self ->{TicketAcl} ->{'ACL-Nome-2'} = {
        # match properteies
        Properties => {
            # current ticket match proprities
            Ticket => {
            Queue => ['Raw'], 
            Priority => ['5 very high'], 
            }
        }, 
        # return possible options (white list)
        Possible => {
            # possible ticket options (white list)
            Ticket=> {
                Queue => ['Alerta']
            },
        },
    },`

Neste exemplo, é bom que se deixe claro que a única ação que restringimos foi a alteração de fila. As outras continuam possíveis de acordo com as parametrizações e permissões do usuário. Por exemplo, ainda é possível adicionar notas ao chamado, respondê-lo, mudar seu status para qualquer um disponível no sistema.

É possível notar que existem dois blocos de código neste exemplo acima. O primeiro com comentário "# match properties" é a definição das propriedades atuais do ticket, como se fosse um filtro onde definimos em que ocasiões essa ACL será aplicada.

No segundo bloco definimos as restrições ou permissões que os tickets que "caírem" nesta ACL sofrerão.

Pode criar ACL's através da interface do Ligero Smart, acesse __*Administração -> Listas de Controle de Acesso*__

Adicione uma nova ACL clicando em "Criar nova ACL".

Preencha os campos aseguir:

img

__Dicas:__
* As ACL's são interpretadas e ordem alfabética, por tanto, uma ACL que comece com a letra "Z" pode invalidar as condições de uma ACL que começa com a letra "A".
* Altere a validade da ACL para "Válido"
Após preencher esta lista, clique em *Salvar*.

Você terá então que começar a comporsua ACLna tela abaixo:

img

Um exemplo:

img

Vamos etender a seguir, as seções que compõe uma ACL.

## Seções que Compõe as ACL's

### *Properties*

Aqui definimos os critérios, ou seja, o filtro que definirá se esta ACL será executada ou não. No exemplo abaixo, definimos que os chamados serão afetados caso o atendente selecione a prioridade '5 muito alta'na tela em que está.

    Properties => {  
        Tickets => {  
    Priority => ['5 very high'],  
        }  
    },

### *PropitiesDatabase*

Assim como "Properties", esta seção é um filtro. A diferença entre ambas é que Properties realiza a comparação com os valores que estão na tela, durante uma modificação por exemplo de valores, classificação de chamados etc, enquanto PropertiesDatabase realiza uma comparação com asinformações que estão no banco de dados do chamado. No exemplo abaixo, os chamados que possuem prioridade muito alta serão afetadas, independentemente das alterações em curso na tela.

    PropertiesDatabase => {
        Ticket => {
        Priority => ['5 very high'],
        }
    },

### *Possible*

Define quais os valores que poderão ser escolhidos. Outros valores serão excluídos da exibição. No exemplo abaixo, os chamados que corresponderem aos critérios definidos em PropertiesDatabase, poderão apenas serem movidos para a fila 'Alerta' e para nenhuma outra. Lembrando que aqui estamos restringindo apenas a fila para onde ele poderá ser movido, todas as outras funções tais como criar nota, responder, bloquear, não são afetadas.

    Possible => {
        Ticket => {
            Queue => ['Alerta'],
        },
    },

### *PossibleNot*

Define os valores que não poderão ser exibidos. Todos os outros valores serão. No exemplo abaixo, os chamados poderão ser movidos para quaisquer filas, menos para a fila Alerta.

    PossibleNot => {
        Ticket => {
            Queue => ['Alerta'],
        },
    },

Vamos simular então uma ACL onde o atendente nunca poderá fechar um chamado se o mesmo estiver na fila Raw com prioridade 5. Ficaria assim:

    # Ticket acl
    $Self ->{TicketAcl}->{'ACL-Alerta5'} = {
        # match properties
        Properties => {
            # current ticket match porperties
            Ticket => {
            Queue => ['Raw'],
            Priority => ['5 very high'],
            }
        },
        # return possible options (white list)
        Possible => {
            # possible ticket options (ehite list)
            Ticket => {
                Queue => ['Raw'],
            },
            Action => {
                AgentTicketClose => 0,
            },
        },
        PossibleNot => {
            # possible not ticket options 
            Ticket => {
                State => ['closed successful', 'closed unsuccessful'],
            },
        },
    },

### *PossibleAdd*

Adiciona valores possíveis a um atributos, sem ser restritivo. Um exemplo: permitir que um usuário encerre o chamado apenas após este ser classificado:  
1. Crie uma ACL que retire os estados "[RegExp]^closed" usando o PossibleNot.  
2. Crie uma ACL que adiciona os mesmos estados usando o PossibleAdd, quando o serviço for definido.

## Propriedades

### *Action*

No exemplo acima, vimos o elemento "Action". Ele define se uma tela so sistema ficará disponível ou não para o atendente. Porém, ela deve ser declarada apenas na seção "Possible", mesmo que o objetivo seja negar a exibição do módulo. Para habilitar, coloque o valor 1, para negar, coloque o valor 0, como no exemplo acima: 

    Action => {
        AgentTicketClose => 0,
    },


## Expressões Regulares 

Também é possível utilizar expressões regulares. No exemplo abaixo (retirado da documentação oficial), exibimos apenas serviços que comecem com a palavra "Hardware", para um ticket estiver na HW ou uma de suas subfilas:

    $Self->{TicketAcl}->{'100-only-Hardware-Services-for-HW-Queues'} = {
        # match properties 
            # note we don't have "Ticket => {"because there's no ticket yet}
            Properties => {
            Queue => ['[RegExp]HW'], 
            }
        },
        # return possible options
        Possible => {
            # possible ticket options
            Tiket => {
                Service => ['[RegExp]^(Hardware)'],
            },
        },
    },

Vale a pena lembrar que os serviços começados com a palavra "Hardware" continuaram sendo exibidos em outras filas. Foi utilizado esse tipo de ACL que construimos um módulo que permite escolher os serviços que queremos exibir em cada uma das filas do sistema.

## Parâmetros possíveis 

Vela o link abaixo a referência de todos os parâmetros possíveis para as ACL's

????
