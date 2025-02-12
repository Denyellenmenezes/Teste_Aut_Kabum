*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}              Chrome
${URL}                  https://www.kabum.com.br
${PAGE_TITLE}           KaBuM!
${SEARCH_BAR}           //*[@id="input-busca"]
${PRODUCT_NAME}         notebook
${ZIP_CODE}             //*[@data-testid="ZipCodeInput"]
@{SHIPPING_PRICES}      //*[@id="listaOpcoesFrete"]//span[contains(text(),  "R$")]
${ADD_TO_CART_BTN}      (//button[@class="sc-abb313e2-0 bAFBQb"])[0]
${BTN_ADD_SERV}         //button[@data-testid="add-service"]
${BTN_N_ADD_SERV}       //button[descendant::text()[contains(., 'Continuar sem serviço')]]
${GO_TO_CART}           //button[@data-testid="go-to-cart"]
${BTN_CLOSE_SHIPPING}   //button[@aria-label="Fechar"]//descendant::*[contains(@class, 'IconClose')]
${12_WARRANTY}          //input[@name="garantia"]/following::text()[contains(., '12 Meses de garantia')]
${CART_ICON}            (//div[@id="header-container"]//descendant::*[contains(@id, "linkCarrinhoHeader")])[1]
${CHROMEDRIVER_PATH}     C:/Teste_Aut_Kabum/chromedriver.exe

*** Test Cases ***
Deve acessar o site da kabum
    Open Browser    ${URL}    ${BROWSER}    executable_path=${CHROMEDRIVER_PATH}
    ${TITLE}=   Get Title
    Should Contain      ${TITLE}    ${PAGE_TITLE}
    Close Browser
