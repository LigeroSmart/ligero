## Apresentação

O Ligero é uma ferramenta de gestão de Help Desk. Baseada na plataforma líder de mercado o OTRS (Open Technology Real Services) e integrado a ferramentas de manupilação de Big Data. Seu código é aberto , estável e altamente flexível. Realizada pela Complemento, na qual, conta com o apoio de profissionais qualificados e certificados.
Finalmente, trata-se de uma ferramenta de código aberto e sem custo por licença de uso.
Ao optar pelo Ligero como sistema de gestão de chamados automaticamente a organização tem em mãos uma ferramenta que proporciona respostas automáticas e imediatas para situações repetitivas, auxiliando os atendentes a encontrae causa raiz de problemas diversos. Permitirá, ao longo do tempo, adotar outras boas  e melhores práticas do ITIL e desfrutar de todos os benefícios que este framework oferece.

### Arquitetura

O Ligero é uma aplicação Web desenvolvida em linguagem Perl, altamente escalável e flexível. Pode ser instalada em sistemas operacionais Linux, Windows e Unix em conjunto a um servidor Web e é acessada pela maioria dos navegadores modernos. 
O Ligero é composto por vários módulos. O principal é o Framework, que contém funções basicas do sistema, como gerenciamento de usuários por exemplo. Depois de instalado, é possível adicionar módulos adicionais para expandir as funcionalidades do Ligero, adicionando por exemplo o Ligero ITSM, ou módulo de gerenciamento de conhecimento (FAQ) ou uma integração com sistemas de monitoramento.


## Funcionalidades básicas do sistema.

### *Interface Web*

* Interface Web para que o atendente possa visualizar e trabalhar os tickets dos clientes;    
* Interface Web para administrar o sistema;    
* O cliente também pode ver seus tickets e criar novos a partir de uma interface Web Suporte e temas (skins);   
* Sistemas unificados de login (ex. HTTPBasicAuth ou Active Directory);  
* Suporte à vários idiomas;  
* Você pode costumizar os templates de cada parte do sistema de forma independente (dtl);    
* É possível anexar arquivos nos tickets;  

### *Interface de E-mail*

* Suporta Anexos;  
* Encaminhando dos e-mails entrantes por caixas de correiosespecíficas, ou através de filtrage de palavras do e-mail;  
* Respostas automáticas personalizadas para os clientes por fila;  
* O sistema notifica os agentes por e-mail sempre que há um novo ticket, follow ups ou quando um chamado está no seu limite de tempo para ser resolvido (SLA);  

### *Ticket*

* Visão personalizada de filas ou visão de todos os tickets;  
* Bloqueio de Tickets;   
* Respostas automámticas personalizadas por fila 
Histórico do Ticket, evolução ds status e ações do ticket;   
* Você pode definir diferentes prioridades para cada Tickets;   
* Contagem de tempo de cada Ticket (e idade do mesmo) 
Impressão em PDF;  
* Pode marcar o Ticket como pendente de solução ou de resposta;  
* Além do atendente, é possível eleger mais um responsável para o ticket;  
* Ações em lote (ex. fechar vários Tickets de uma vez)
Camada de eventos para s Tickets;  
* Atendente Genérico: Automatização ações em Tickets, através de tarefas agendadas;   
* Pesquisa FullText;  
* Suporte ACL nos Tickets; 

### *Interface responsiva (ceular)*

O Ligero possui interface responsiva, que se adapta a tela de dispositivos móveis como tablets e celulares de maneira a facilitar a leitura do contúdo.

### *Sistema*

* Definição de caendários e horários de atendimento para cálculos de tempo e SLAs;  
* A base de dados de clientes pode vir de um Banco de Dados SQL ou de uma fonte LDAP (ex. eDirectory, AD, OpenLDAP);  
* TIcketHook customizável, por exemplo: 'Call#', 'MyTicket#', 'Request#', or 'Ticket#';  
* Formato de numeração dos tickets customizável; 
* Camada de banco de dados que dá ao sistema suporte a diferentes softwares, tais como MySQL, PostgreSQL, Oracle, DB2 e MSSQL;  
* Um framework de estatísticas e relatórios;  
* Frontend e backend com suporte ao charset UTF-8;  
* Suporte a instalaçào de módulos;   
* Login de atendentes (agentes) e clientes de diferentes formas: banco de dados, ldap, httpauth ou radius;  
* Criação e gestão de contas, grupos e papéis;  
* Criação de respostas padrões;  
* Criação de subfilas;  
* Criação de assinaturas padrões por fila;   
* Criação de saudações padrões por fila;  
* Notificação por e-mail disparada pelos administradores;   
* Notificação por e-mail envido para reportar problemas;   
* Envio de atualizações por e-mail ou pela interface Web;  
* Fuso horário global;   
* Interface Web para confuiguração o sistema;  
* Permalinks para todos os objetos (tickets, faqs, etc);  
* Diferentes níveis de permissão;  
* Fácil implementação de addon's.