## FAQ - Base de Conhecimento

Licenciamento deste Manual/Documento

---------

## FAQ - Apresentação

O módulo de FAQ é uma extensão do Ligero Smart, para formar uma base de conhecimento de perguntas frequentes, ou no nosso caso, de erros, problemas, procedimentos entre duas atividades. Servem para auxiliar os atendentes ou clientes, sendo ela interno, externo ou publica.

## Instalação

Para realizar a instalação da FAQ no Ligero Smart, vamos seguir o mesmo modelo do manual 08 - Gerenciamento de Pacotes  
Realize o Download do módulo da FAQ pelo link abaixo:  
[link](?)


Após finalizaro download, acessar *Administração -> Gerenciador de Pacotes.*  
Clicar em "Escolher arquivo" e selecionar o arquivo FAQ--- e em seguida clicar em *Instalar Pacote*.  
Na próxima tela, o sistema mostrará o informativo da instalação, clique em *Continuar*.  
A tela seguinte é a do Gerenciador de Pacotes, onde o Repositório local já mostra a FAQ instalada.  

### Configurações Nativas da FAQ

__Grupos__

Quandoa FAQ é instalada, ela cria 3 grupos no Ligero Smart.

img

Cada grupo possui as permissões de "Somente Leitura", "Mover Para", "Criar", "Nota", "Proprietário", "Prioridade" e "Leitura" e "Escrita", padrões do Ligero Smart.

__Grupo faq:__ Caso todas as permissões do grupo seja dada ao atendente, ele tem permissões para Criar, Explorar, Jornal e Procurar. Caso tirarmos a permissão do usuário de "Criar" do grupo FAQ, ele não terá mais permissão para criar, apenas de leitura.

__Grupo faq_admin:__ Trabalha em conjunto com o "grupo faq. Sendo assim, caso todoas as permissões da faq_admin ser atribuída ao atendente mas não ser atribuída no grupo faq, ele não terá permissão. Então para administradores de FAQ tem que ter permissão em faq e faq_admin.  
Com as permissões de administração, agora poderá realizar as seguintes atividades:  
Explorar, Nova, Jornal, Gestão de Idiomas, Gerenciamento de Categorias e Procurar. 

__Grupo faq_approval:__ Trabalha em conjunto com o grupo da faq. Nessa categoria, caso habilitado, a FAQ antes de ser colocada em produção, tem-se a aprovação da mesma. O grupo approval não precisa necessáriamente ter permissão para criar uma FAQ ou permissões administrativas.

### FAQ - Configuração do Sistema 

Nessa sessão vamos explicar algumas configurações importantes para FAQ.  
Para iniciar, acesse "Configuração do Sistema" e no listbox e escolha "FAQ".  
__FAQ -> Core.__ Nesta opção temos as seguintes configurações:  
FAQ::MultiLanguage: Permissão de vários idiomas na FAQ.  
FAQ::Volting: Permissão de avaliação das FAQs.  

__Core::Aproval__

FAQ::ApprovalRequired: Se novas FAQs precisam de aprovação para entrar em operação.  
FAQ::ApprovalQueue: Fila padrão quando houver uma FAQ aguardando aprovação.   
__Frontend::Agent::ToolBarModule__  
Frontend::ToolBArModule###90-FAQ::AgentFAQAdd: Mostrar ícone de FAQ no toolbar.

## Criando uma FAQ - Ciclo Completo

Nesse capítulo do manual, iremos criar uma FAQ, criando categorias e passando pela aprovação.  
Com fila FAQ_Approval criada com o grupo faq_approvalRequired estiver como sim, sega os passos para realizar a criação da FAQ.  
Antes de iniciar a criação da nova FAQ, vamos criar uma categoria da FAQ.  
Com um usuário com permissões administrativas na FAQ, para isto, clique em FAQ -> Gerenciamento de Categoria:  

img

Na próxima tela, clique em adicionar categria. Assim incluiremos as seguintes categorias:  
Suporte  
Suporte::Hardware  
Suporte::Software  
Suporte::Sistema  

A tela seguinte é a Adicionar artigo de FAQ.

img

Defina um título para a FAQ e defina as palavras chaves dessa FAQ. Escolha a Categoria, no exemplo acima, no caso, escolhemos Suporte::Sistemas.  
O estado definirá se a FAQ vai ser interno, externo para clientes ou publico.  
Coloque Validade: Válido; Idioma:pt_BR; Aprovação: Sim.  
Caso precise anexar algum arquivo nessa FAQ, podemos clicar em *Escolher* arquivo desejado.  
Os campos seguintes são:  
Sintoma, Problema, Solução e Comentário. Os três primeiros são campos públicos, que quando o Estado definido como Externo ou Público esterá disponível para visualização. O Comentário é visualizado apenas pelos atendentes internos.  
Preenchido esses campos, clicar em *Criar*. Para visualizar a FAQ criada, clique em *FAQ -> Explorador -> Suporte -> Sistemas*  