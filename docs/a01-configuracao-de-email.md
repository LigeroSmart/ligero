## Recebimento de E-mail

O Ligero Smartpermite criar e-mails a partir de uma conta de e-mail de sua organização. Ele monitora uma conta de e-maildos protocolos mais conhecidos como POP3 e IMAP. Havendo um e-mail novo, o Ligero Smart puxa esta mensagem e converte em um novo chamado no sistema, podendo enviar uma resposta automática ao cliente com o número do chamado criado. Além disso, o cliente pode adicionar novas mensagens ao chamado criado através de e-mail, bastando ter campo assunto o número do mesmo.

Para fazer com o Ligero monitore uma conta de e-mail, acesse *"Administração -> Contas de E-mail PostMaster"*.

img

Clique em *"Adcionar Conta de E-mail"*. A tela abaixo será exibida.

img

__Principais Campos:__

__Tipo:__ Defina aqui o tipo do seu servidor de emails: IMAP, IMAPS, IMAPTLS, POP3, POP3S, POP3TLS.

__Confiável:__ Marque "Sim" caso queira usar algum tipo de Filtro Postmaster em e-mails que chegam nesta conta, caso contrário os filtros não serão aplicados.

__Despachando:__ Se selecionado "Distribuição De Acordo Com A Fila Selecionada", os e-mails novos gerarão chamados na fila selecionada no campo "Fila". Se "Distribuição De Acordo Com O Campo de E-mail Para:" estiver selecionado,o sistema irá verificar qual é o destinátario e criará o chamado na fila que correspondera a este destinátario. Este recurso é útil caso você tenha apenas uma conta de e-mail, porém com muitos aliases (Apelidos), por exemplo [servicedesk@minhaorganizacao.com]() e [comercial@minhaorganizacao.com]() como apelidos de uma mesma conta, desta forma, os chamados serão criados na fila que tiver este e-mail registrado no campo "Endereço de Sistema".

__*Ajustando o Tempo de Obtenção de E-mails*__

O Ligero Smart por padrão obtem e-mails a cada 10 minutos.
Para ajustar este tempo, acesse: *Administração -> Configuração do Sistema -> Daemon -> Daemon::ShedulerCronTaskManager::Task*

img

Neste exemplo, parametrizamos a obtenção para ser realizada a cada dois minutos.

## Envio de E-mail

O Ligero Smart realiza envio demensagens e e-mails para os clientes e notificações para clientes e atendentes.

Para isto temos que realizar as seguintes configurações:

Acese *Administração -> Endereço deE-mail*

img

Se o seu sistema possui apenas uma conta de e-mail de envio, altere a conta padrão "Ligero System".

img

Basta acessar esta conta e colocar seus detalhes.

Em seguida, vamos configurar o servidor de envio. Acesse *Administração -> Configuração do Sistema -> Framework -> Core::Sendmail*

img

Os parâmetros disponíveis nesta tela são:  
__SendmailModule:__  
    DoNotSendmail - Não dispara e-mails. Bom para sistemas de homologação SMTP, SMTPS, SMTPTLS - Sistemas de Envio SMTP  
    Sendmail - Utiliza o sendmail do Linux - Configuração um pouco mais complicada.

__SendmailModule::Host, SendmailModule::Port,__  
__Sendmail::AuthUser, SendmailModule::AuthPasswrds:__  
    Configurações adicionais para os módulos de envio SMTP (Utilizar apenas com o SendmailModule SMTP, SMTPS, SMTPS).

Outra configuração interessante pode serfeita em *Administração -> Configuração do Sistema -> Framework -> Core*, nos parâmetros NotificationSenderName e NotificationSenderEmail. Neles definimos o remetente dos e-mails de notificação do sistema para os Atendentes.

__Observações:__  
O Ligero Smart por padrão permite a configuração de apenas uma conta de envio. Casoqueira utilizar mais que uma conta de envio, será necessário configurar a cont cadastrada noseu servidor de e-mails, de forma que ele permita que esta conta envie e-mails por outras contas.

## FAQs Complemento Relacionadas

Mais informções podem ser encontradas nas FAQs disponíveis no sistema Complemento:

| 51002 | Erro: LIGERO NOTICE: PostMasterMailbox.plis already running (use '-f1'if you want to start it forced)! |
|-------|--------------------------------------------------------------------------------------------------------|
| 51005 | LIGERO - Envio através do Sendmail                                                                     |
