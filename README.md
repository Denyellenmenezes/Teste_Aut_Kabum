# 🛒 **Automação de Compra no Kabum - Robot Framework**  

## 📌 **Descrição**  
Este projeto utiliza o **Robot Framework** com **Selenium WebDriver** para automatizar a navegação no site [Kabum](https://www.kabum.com.br). O objetivo é:  
✅ Realizar uma busca por um produto  
✅ Selecionar o primeiro item da lista  
✅ Validar os valores de frete  
✅ Adicionar ao carrinho com uma **garantia de 12 meses**  
✅ Finalizar a compra  

---

## ⚙️ **Requisitos**  

- 🐍 **Python 3.x**  
- 🤖 **Robot Framework**  
- 🌐 **Selenium WebDriver**  
- 🖥️ **ChromeDriver** (para automação no Google Chrome)  

---

## 📥 **Instalação das Dependências**  

1️⃣ **Instale o Python 3.x** *(se ainda não estiver instalado)*  
2️⃣ Instale o **Robot Framework**:  
   ```sh
   pip install robotframework
   ```
3️⃣ Instale o **Selenium Library** para integração com o Selenium:  
   ```sh
   pip install robotframework-seleniumlibrary
   ```
4️⃣ **Baixe o ChromeDriver** compatível com a versão do seu Google Chrome. 🔗 [Clique aqui para baixar](https://chromedriver.chromium.org/downloads)  
5️⃣ **Configure o ChromeDriver**:  
   - Após o download, coloque o arquivo em um diretório de fácil acesso.  
   - No código, altere a variável `${CHROMEDRIVER_PATH}` para apontar para o caminho correto do arquivo.  

---

## 📂 **Estrutura do Código**  

📌 **Settings**  
   - Importa as bibliotecas necessárias (**SeleniumLibrary, String**).  

📌 **Variables**  
   - Define variáveis usadas nos testes (URLs, XPaths, produto, frete).  

📌 **Test Cases**  
   - Casos de teste como **buscar um produto, verificar frete, comprar o item e validar o carrinho**.  

📌 **Keywords**  
   - Contém **palavras-chave reutilizáveis** para validações e manipulação de elementos da página.  

---

## ▶️ **Como Executar os Testes**  

1️⃣ **Clone este repositório** ou baixe o arquivo `.robot` para o seu computador.  
2️⃣ **Abra o terminal** na pasta onde o arquivo `.robot` está localizado.  
3️⃣ **Execute o comando:**  
   ```sh
   robot nome_do_arquivo.robot
   ```
4️⃣ O Robot Framework executará os testes e exibirá os **resultados no terminal**.  

---

## 🔄 **Fluxo de Execução**  

1️⃣ **Acessar o site**: O navegador é aberto e o site Kabum é carregado.  
2️⃣ **Busca por notebook**: A pesquisa pelo termo **"notebook"** é realizada.  
3️⃣ **Seleção do primeiro produto**: O primeiro item da lista de resultados é selecionado.  
4️⃣ **Verificação de frete**: Os valores são validados dentro de um intervalo esperado.  
5️⃣ **Adicionar ao carrinho**: O produto é adicionado com **garantia de 12 meses**.  
6️⃣ **Finalização da compra**: O carrinho é acessado e validado.  

---

## ✅ **Resultados Esperados**  

🔹 O produto **"notebook"** é encontrado e selecionado corretamente.  
🔹 Os valores de **frete** estão dentro do intervalo esperado (**R$ 1,00 - R$ 400,00**).  
🔹 O produto foi **adicionado corretamente ao carrinho**.  
🔹 A **garantia de 12 meses** foi selecionada com sucesso.  

---

## 📊 **Saídas Analíticas**  

📌 **Logs detalhados** sobre a execução do teste, incluindo:  
✔️ Sucessos e falhas  
✔️ Validação dos valores de frete  
✔️ Registros de cliques e interações na página  

Essas informações ajudam a identificar **possíveis problemas** e validar o funcionamento correto da automação.  

---

## ⚠️ **Considerações**  

🔹 O código foi feito para rodar no **Google Chrome** com **ChromeDriver**.  
🔹 Caso o **layout do site mude**, pode ser necessário ajustar os **XPaths** e o fluxo de navegação.  

---

## 📜 **Licença**  

Este projeto está licenciado sob a **Licença MIT**. Consulte o arquivo `LICENSE` para mais detalhes.  



