*** Settings ***
Library     SeleniumLibrary
Library     String

Test Setup     Acessar o site da kabum
Test Teardown      Fechar Navegador

*** Variables ***
#Variáveis de Ambiente
${BROWSER}              Chrome
${URL}                  https://www.kabum.com.br
${PAGE_TITLE}           KaBuM!

#Variáveis - Página:Home
${SEARCH_BAR}           //*[@id="input-busca"]
${PRODUCT_NAME}         notebook

#Variáveis - Página:Busca
${FIRST_PRODUCT}        (//div[@id="main-content"]//*[@class="imageCard"])[1]
${FIRST_PRODUCT_TEXT}   //h1
${BTN_SEARCH}           (//button[@aria-label="Buscar"])[1]

#Variáveis - Página:Produto
${ZIP_CODE_PATH}        //*[@data-testid="ZipCodeInput"]
${ZIP_CODE_VALUE}       51111011
${SHIPPING_PRICE_ONE}   (//div[@role='dialog']//descendant::*[contains(text(),'R$')])[1]
${SHIPPING_PRICE_TWO}   (//div[@role='dialog']//descendant::*[contains(text(),'R$')])[2]
${ADD_TO_CART_BTN}      (//button[@class="sc-abb313e2-0 bAFBQb"])[0]
${BTN_CLOSE_SHIPPING}   //button[@aria-label="Fechar"]//descendant::*[contains(@class, 'IconClose')]
${GO_TO_CART}           (//button[contains(text(),'COMPRAR')])[1]
${BTN_SHIPPING_PATH}    //button[@id="botaoCalcularFrete"]
${SHIPPING_POPUP}       //div[@role='dialog']
${PRODUCT_CODE}         //span[contains(text(), 'Código:')]

#Variáveis - Página: Pré-Carrinho
${12_WARRANTY}          //span[contains(text(), '12 Meses de garantia')]/ancestor::label//input[@type='radio']
${CART_ICON}            (//div[@id="header-container"]//descendant::*[contains(@id, "linkCarrinhoHeader")])[1]

#Variáveis - Carrinho
${PRODUCT_LINK}         (//a[@href="/produto/505667/macbook-pro-apple-16-m3-pro-cpu-12-n-cleos-gpu-18-n-cleos-36gb-ssd-512gb-prateado"])[2]

#Outras Variáveis
${EXPECTED_MIN_PRICE}   1.00
${EXPECTED_MAX_PRICE}   400.00
${element}              //h1
${CHROMEDRIVER_PATH}    C:/Teste_Aut_Kabum/chromedriver.exe
${PRODUCT_ID}      //*[contains(text(),"MacBook")]                               


*** Test Cases ***

CA01 - Deve Buscar pelo produto notebook 
    Procurar por produto notebook
   
CA02 - Deve selecionar o primeiro Produto
    Procurar por produto notebook
    Selecionar o primeiro produto
    
CA03 - Verificar Valores de Frete
    Verificar que os fretes possuem valores  
        
CA04 - Comprar Produtos
    Verificar que os fretes possuem valores 
    Acessar Pré-carrinho
             
CA05 - Selecionar garantia de 12 meses 
    Verificar que os fretes possuem valores 
    Acessar Pré-carrinho
    Selecionar garantia de 12 meses   

CA06 - Acessar carrinho de compras 
    Verificar que os fretes possuem valores 
    Acessar Pré-carrinho
    Selecionar garantia de 12 meses
    Acessar carrinho
    
CA07 - Validar produto no carrinho de compras
    Validar produto no carrinho

*** Keywords ***
Convert Price To Number
# Objetivo da Keyword: converter um texto contendo um valor monetário 
# em um número que pode ser utilizado para cálculos e comparações

#Necessidade da Keyword: A Keyword foi criada para solucionar o problema 
#de validação de preços no pop-up de Frete. Os valores são dinâmicos e mudam constantemente 
#Por conta disso, não poderia ver o valor na tela e criar um código que validasse o preço que vi. 
#Como não daria para validar o valor específico por frete, validei dois pontos: Se os fretes tinham preço
#através da Keyword "Verificar que os fretes possuem valores"
#E se os preços condiziam com os valores mais comuns de fretes, os quais estabeleci que seriam 
# Valor mínimo = 0R$ e Valor Máximo: 500 R$ {Essas variáveis estão em "Outras Variáveis"}
    [Arguments]    ${price_text}
#A linha 94 remove o símbolo R$ do valor contido na variável price_text
    ${price_text}=    Remove String    ${price_text}    R$
#A linha 96 substitui no valor contido na variável price_text as virgulas por ponto. 
    ${price_text}=    Replace String    ${price_text}    ,    .
#A linha 98 converte o valor de string para número
    ${price}=    Convert To Number    ${price_text}
#A linha 100 retorna o valor de preço que foi convertido para número
    [Return]    ${price}
Validate Value In Range
#Objetivo da Keyword: Essa Keyword é a keyword responsável por validar se os 
#valores de frete estão dentro do range 
#gerado pelas variáveis: ${EXPECTED_MIN_PRICE}   1.00 | ${EXPECTED_MAX_PRICE}   400.00

#Necessidade da Keyword: É parte da solução encontrada para a validação dos preços de frete
    [Arguments]    ${valor}    ${min}    ${max}
    Should Be True    ${valor} >= ${min} and ${valor} <= ${max}    O valor ${valor} não está dentro do intervalo esperado (${min} - ${max}).

#Objetivo das Keywords abaixo: Adicionei os códigos relacionados aos steps de teste em keywords em geral
#para deixar o código mais claro para stakeholders que não necessariamente sejam codificadores 
#Também tinha o objetivo de reaproveitar o código sem que houvesse muita repetição das mesmas linhas

Acessar o site da kabum
#Descrição:
#O código da linha 120 abre uma URL em um navegador específico, que no caso 
#É o Chromedriver, navegador mais compatível com o selenium 
#Para utilizar o browser é necessário informar como parâmetro o caminho para acessar 
#O chromedriver
    Open Browser    ${URL}    ${BROWSER}    executable_path=${CHROMEDRIVER_PATH}
#A linha 123 armazena o titulo da página (O título que aparece no navegador ao abrir uma página web)
#em uma variável
    ${TITLE}=   Get Title
#A linha 125 apenas maximiza a janela onde o teste está sendo executado
    Maximize Browser Window
#A linha 129 está validando que o ${TITLE}, {que possui o valor extraído do título do navegador}  
#contém o valor da variável ${PAGE_TITLE} {que é igual a KaBuM!, foi definido como variável em
#"Variáveis de ambiente"} na linha 12
    Should Contain      ${TITLE}        ${PAGE_TITLE}

Procurar por produto notebook
#Descrição:
#A linha 134 localiza a barra de pesquisa e escreve o nome notebook 
    Input Text      ${SEARCH_BAR}       ${PRODUCT_NAME}
#A linha 136 clica no botão de pesquisar
    Click Element   ${BTN_SEARCH}

   
Selecionar o primeiro produto
#Descrição:
#A linha 164 foi adicionada com o objetivo de resolver o problema da distribuição dos elementos em tela
#Sei que o Scroll element Into View é mais utilizado do que a estratégia de zoom, mas acreditei ser mais
#eficiente utiliza-la devido a configuração do site que estou testando. Tem muitos elementos grandes
#E mesmo com o Scroll element into view foi dificil localizar os elementos 
#Como de ambas as estratégias, consegui melhores resultados com a manipulação do zoom, decidi mantê-la. 
    Execute JavaScript    document.body.style.zoom = '50%'
#Na linha 148 o código está aguardando o primeiro produto aparecer em tela. O código aguardará 10 segundos
    Wait Until Element Is Visible       ${FIRST_PRODUCT}        timeout=10
#A linha 150 seleciona o primeiro produto em tela
    Click Element   ${FIRST_PRODUCT}
#As linhas 155 e 156 verificam que ao clicar no primeiro produto o usuário é redicerinado a página 
#específica do produto. Todas as páginas específicas começam com o site da kabum e em seguida /produto
#Por isso utilizei a abordagem de verificar que na url contém ambas as informações que não mudam 
#de produto para produto. 
    ${url} =    Get Location
    Should Contain    ${url}    https://www.kabum.com.br/produto/

Verificar que os fretes possuem valores 
    Procurar por produto notebook
    Selecionar o primeiro produto
    Execute JavaScript    document.body.style.zoom = '50%'
#A linha 164 valida que o usuário está mesmo na página de produto. 
#O elemento ${element} é o elemento onde esta localizado o título do produto
    Wait Until Element Is Visible       ${element}        timeout=10
#Linha 168: Adicionei esse código para evitar que o CEP fosse escrito "no nada"
#Para evitar erros relacionados ao campo CEP não estar selecionado e não aceitar a inserção de dados
#Achei mehor clicar no campo antes de inserir o valor
    Click Element       ${ZIP_CODE_PATH}   
#A linha 170 Adiciona o valor de CEP ao campo    
    Input Text      ${ZIP_CODE_PATH}         ${ZIP_CODE_VALUE}
#A linha 172 Clica no botão para calcular o frete 
    Click Element       ${BTN_SHIPPING_PATH}
#As linhas 174 e 175 Aguardam os valores de fretes estarem disponíveis para visualização
    Wait Until Element Is Visible        ${SHIPPING_PRICE_ONE}     timeout=10
    Wait Until Element Is Visible        ${SHIPPING_PRICE_TWO}     timeout=10
#As linhas 177 e 178 armazenam os textos (preços) dos fretes em variáveis
    ${SHIPPING_PRICE_ONE_TEXT}=   Get Text    ${SHIPPING_PRICE_ONE}
    ${SHIPPING_PRICE_TWO_TEXT}=   Get Text    ${SHIPPING_PRICE_TWO}
#As linhas 181 e 182 convertem esses preços que foram puxados de string para number
#Essa conversão é necessária para que a comparação com os valores min e max seja possível
    ${SHIPPING_PRICE_ONE_NUMBER}=       Convert Price To Number     ${SHIPPING_PRICE_ONE_TEXT}
    ${SHIPPING_PRICE_TWO_NUMBER}=       Convert Price To Number     ${SHIPPING_PRICE_TWO_TEXT}
#As linhas 185 e 186 utilizam a keyword Validate value in range para validar se os preços de frete 
#Estão dentro do range estabelecido para os preços de frete
    Validate Value In Range    ${SHIPPING_PRICE_ONE_NUMBER}         ${EXPECTED_MIN_PRICE}       ${EXPECTED_MAX_PRICE}
    Validate Value in Range    ${SHIPPING_PRICE_TWO_NUMBER}         ${EXPECTED_MIN_PRICE}       ${EXPECTED_MAX_PRICE}
    Execute JavaScript    document.body.style.zoom = '70%'
#A linha 189 fecha o pop-up de frete, requisito pedido na documentação que foi passada. 
    Click Element       ${BTN_CLOSE_SHIPPING}

Acessar Pré-carrinho
    Execute JavaScript    document.body.style.zoom = '40%'
#A linha 194 clica no botão "COMPRAR" na página de produto
    Click Element       ${GO_TO_CART}
    
Selecionar garantia de 12 meses
#A linha 198 aguarda até que a frase "produto adicionado ao carrinho" apareça para o xpath selecionado
    Wait Until Element Is Visible       //*[contains(text(), 'Produto adicionado no carrinho')]     timeout=18
    Execute JavaScript    document.body.style.zoom = '20%'
    
#A linha 202 seleciona a opção de garantia de 12 meses, requisito pedido na documentação que foi passada.
    Click Element       ${12_WARRANTY}
    
Acessar carrinho
    Execute JavaScript    document.body.style.zoom = '80%'
#As linhas 208 e 209 respectivamente, aguardam o ícone de carrinho aparecer e clica nesse ícone
#Entrando assim na página de carrinho
    Wait Until Element Is Visible       ${CART_ICON}        timeout=10
    Click Element       ${CART_ICON}
    Execute JavaScript      document.body.style.zoom = '20%'

Validar produto no carrinho
#A linha 216  armazenam o código do produto em uma variável 
    Procurar por produto notebook
    Selecionar o primeiro produto
    ${FIRST_PRODUCT_CODE}=         Get Text        ${PRODUCT_CODE}
#As linhas 218 a 221 tratam o valor para conter apenas numeros
    ${FIRST_PRODUCT_CODE}=    Set Variable          ${FIRST_PRODUCT_CODE}  
    ${ONLY_NUMBER}=     Remove String      ${FIRST_PRODUCT_CODE}      Código: 
    ${ONLY_NUMBER}=     Replace String      ${ONLY_NUMBER}       '"" '   ''
    ${ONLY_NUMBER}=     Strip String      ${ONLY_NUMBER}
    Acessar Pré-carrinho
    Selecionar garantia de 12 meses
    Acessar carrinho  
    Execute JavaScript      document.body.style.zoom = '55%'
    sleep       1
    
#A linha 231 aguarda até que seja possível ver o produto no carrinho
#A linha 232 puxa o atributo href para uma variável, essa variável será utilizada
#poteriormente para validar se o produto correto está no carrinho de compras
   Wait Until Element Is Visible       ${PRODUCT_ID}
    ${PRODUCT_CART_CODE}=    Get Element Attribute    ${PRODUCT_ID}  href
    sleep       5
      
#A linha 237 Verifica se tem qualquer ocorrência do valor contido em {FIRST_PRODUCT_CODE}
#em ${PRODUCT_CART_CODE}
    Should Match Regexp      ${PRODUCT_CART_CODE}       .*(${ONLY_NUMBER}).*
#A linha 240 fecha o navegador
Fechar navegador
    Close Browser