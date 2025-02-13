# Teste_Aut_Kabum
Automação de Compra no Kabum - Robot Framework
Descrição: Este projeto utiliza o Robot Framework com Selenium Webdriver para automatizar a navegação no site www.kabum.com.br. O objetivo é realizar uma busca por um produto, selecionar o primeiro item, validar os valores de frete, adicionar ao carrinho e finalizar a compra com uma garantia de 12 meses.

Requisitos:

Python 3.x
Robot Framework
Selenium Webdriver
Chromedriver (para Chrome)
Instalação das dependências
Instale o Python 3.x (se ainda não o tiver instalado).

Passo a Passo de instalação:
Instale o Robot Framework: pip install robotframework
Instale o Selenium Library para integração com o Selenium: pip install robotframework-seleniumlibrary
Baixe o Chromedriver compatível com a versão do seu Google Chrome a partir de aqui.

Após o download, coloque o arquivo do Chromedriver em um diretório de fácil acesso e altere a variável ${CHROMEDRIVER_PATH} no código para apontar para o caminho correto do arquivo

Estrutura do Código:
O código está estruturado da seguinte forma:

Settings: Importa as bibliotecas necessárias (SeleniumLibrary e String).
Variables: Define as variáveis usadas durante o teste (URLs, XPaths, variáveis de produto e frete).
Test Cases: Define os casos de teste, como buscar por um produto, verificar o valor de frete, comprar o produto e verificar o carrinho.
Keywords: Contém as palavras-chave reutilizáveis para a execução do teste, como validações de valores e manipulação de elementos na página.

Como Executar o Código:
Clone este repositório ou baixe o arquivo .robot para o seu ambiente local.
Abra o terminal ou prompt de comando na pasta onde o arquivo .robot está localizado.
Execute o seguinte comando: robot nome_do_arquivo.robot
Isso executará os testes definidos no arquivo .robot e você verá os resultados no terminal.

Fluxo de Execução:
Acessar o site: O navegador é aberto e o site Kabum é carregado.
Busca por notebook: O código realiza uma busca pelo termo "notebook" na barra de pesquisa.
Seleção do primeiro produto: O primeiro produto listado na página de resultados é selecionado.
Verificação de fretes: O código valida os valores de frete com base em um intervalo definido.
Adicionar ao carrinho: O produto é adicionado ao carrinho após a seleção da garantia de 12 meses.
Finalização da compra: O carrinho é acessado e validado.
Resultados Esperados
Ao final da execução, o teste verificará os seguintes pontos:

O produto "notebook" foi encontrado e selecionado corretamente.
Os valores de frete estão dentro do intervalo esperado (entre R$ 1,00 e R$ 400,00).
O produto foi adicionado corretamente ao carrinho.
A garantia de 12 meses foi selecionada.
Saídas Analíticas
Durante a execução, o Robot Framework fornecerá saídas analíticas detalhadas, incluindo:

Casos de sucesso e falhas:
Informações sobre os valores de frete e validações.
Logs detalhados da execução, como clique de elementos, valores encontrados, etc.
Esses detalhes serão úteis para validar o funcionamento correto da automação e identificar possíveis problemas durante a execução.

Considerações:
O código foi feito para trabalhar com o navegador Chrome, utilizando o Chromedriver.
O comportamento do site pode mudar, afetando os testes. Caso o layout do site seja alterado, pode ser necessário ajustar os XPaths ou o fluxo de navegação.
Licença
Este projeto é licenciado sob a licença MIT - consulte o arquivo LICENSE para mais detalhes.



