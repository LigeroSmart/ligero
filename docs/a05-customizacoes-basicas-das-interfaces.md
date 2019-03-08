## Customizações Básicas das Interfaces 

## Alteração de Logotipos da interface do Cliente

O logotipo padrão do Ligero Smart é assim:

img

Obtenha uma imagem no formato de 135x50 pixels e coloque-a dentro da pasta skins do Ligero Smart ou em algum lugar acessível na internet.

Acesse Admin -> Configurações do Sistema -> Framework -> Frontend::Customer 

Altere o parâmetro CustomerHeadline se desejar.

Habilite o parâmetro CustomerLogo:

img

Altere o sub parâmetro URL acima, colocando o link para a imagem de seu logotipo.

## Alteração de Logotipo da Interface de Atendente

Acesse Admin -> Configurações do Sistema -> Framework -> Frontend::Agent

img

Altere o sub parâmetro URL do parâmetro AgentLogo.

## Criando seu prórpio tema

O Ligero Smart permite customizar o template HTML de suas telas detal forma a modificar a posição de campos por exemplo.

Primeiramente, a recomendação é a criação de uma pasta específica de "tema" para sua organização, conforme oartigo abaixo:

https://ligero.github.io/doc/manual/admin/stable/en/html/themes.html

Resumindo, deve-se criar uma pasta chamada   
Kernel/Output/HTML/Templates/SuaEmpresa e copiar todos os arquivos que se deseja customizar da pasta Kernel/Output/HTML/Templates/Standard para a nova pasta.

__Importante:__ copie apaenas osarquivos que deseja custumizar. O sistema vai automaticamente buscar os demais arquivos na pasta Standard.

Em seguida deve-se ativar o temo criado no parâmetro Frontend::Themes em Administração -> Configuração do Sistema -> Framework -> Core::Web. No exemplo abaixo ativamos um tema chamado "Complemento":

img

Os arquivos deste tema por consequência deem estar na pasta Kernel/Output/HTML/Templates/Complemento.

Também pode-se alterar o tema padrão dos usuários em Administração -> Configuração do Sistema -> Framework -> Core -> DefaultTheme 

Finalmente, se desejar alterar o tema de todos os usuários já existentes no sistema, deve-se executar os comandos SQL abaixo no banco de dados:

update user_preferences set preferences_value = 'SeuTema' where preferences_keys='UserTheme'

update customer_preferences set prefereces_value ='SeuTema' where preferences_key='UserTheme'

Cada atedente ou cliente pode escolher autilização de seu tema preferido através das preferências pessoas: 

img

### *Exemplo: Colocando o campo Impacto antes do SLA*

Copie os arquivos AgentTicketPhone.tt, AgentTicketEmail.tt e AgentTicketActionCommon.tt para sua pasta de tema customizado (Kernel/Output/HTML/Templates/SuaEmpresa)

Em todos os arquivos, encontre e __recorte__ o seguinte bloco selecionado abaixo:

img

Insira o bloco recortado conforme a figura abaixo, entre códigos:

[% RenderBlockEnd("TicketServiceMandatory")%]  
[% RenderBlockSart("TicketSLA")%]  

Veja:

img

Após atualizarmos os arquivos e selecionarmos nosso tema de preferência, o Impacto é exibido entre os campos serviço e SLA como abaixo:

img

