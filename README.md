# 🚀 Missão Prática: Tirando Proveito da Nuvem para Projetos de Software 🌩️  

## 📌 Visão Geral  
Este projeto tem como objetivo consolidar os conhecimentos adquiridos no **Nível 4 | Mundo 4** através da implementação de uma solução na **Microsoft Azure**, abrangendo a criação e configuração de uma infraestrutura completa para suporte a um **aplicativo web e banco de dados SQL**.  

A proposta permite que desenvolvedores pratiquem habilidades essenciais em **Cloud Computing**, configurando **Máquinas Virtuais, Regras de Segurança, Bancos de Dados e Aplicações Web**.  

---

## 🎯 Objetivos  
✅ Criar e gerenciar recursos na **Nuvem Azure**  
✅ Provisionar uma **Máquina Virtual (VM)** no **Azure**  
✅ Definir **grupos de segurança e regras de rede**  
✅ Criar e configurar um **banco de dados SQL** no **Azure**  
✅ Importar arquivos **.bacpac** e realizar operações **CRUD**  
✅ Desenvolver um **aplicativo web** e hospedá-lo na nuvem  

---

## 🛠️ Tecnologias Utilizadas  
- **Microsoft Azure**  
- **Azure Virtual Machines**  
- **Azure SQL Database**  
- **Azure Cloud Shell**  
- **T-SQL (Transact-SQL)**  
- **Azure CLI**  
- **GitHub para versionamento**  
- **Bash/PowerShell para administração de recursos**  

---

## 📋 Estrutura das Atividades  

### **1️⃣ Criando uma Máquina Virtual no Azure**  
- Provisionamento de uma **VM Linux/Windows**  
- Configuração de **parâmetros básicos** (região, tamanho, credenciais)  

### **2️⃣ Configuração de Regras de Segurança na VM**  
- Implementação de **grupos de segurança de rede**  
- Definição de **regras para tráfego HTTP/HTTPS e SSH/RDP**  

### **3️⃣ Criando um Banco de Dados SQL no Azure**  
- Criação e configuração de um **Azure SQL Database**  
- Importação de dados e configuração de permissões  

### **4️⃣ Conectando-se ao Banco de Dados**  
- Utilização do **Azure Cloud Shell** e **Azure CLI** para manipulação do banco  
- Verificação e listagem dos bancos de dados provisionados  

### **5️⃣ Operações CRUD no Banco de Dados**  
- Criação da tabela **Drivers**  
- Inserção, consulta, atualização e remoção de dados  

---

## 📌 Caso de Uso: LogiMove Transportes  
A aplicação foi desenvolvida para **LogiMove Transportes**, uma empresa do setor de logística, enfrentando desafios como:  
❌ Excesso de papelada e atrasos na comunicação  
❌ Motoristas aguardando longos períodos devido à má coordenação  
❌ Impacto negativo na satisfação do cliente  

**Solução:** 🚀  
✔ Gerenciamento eficiente de **motoristas, clientes e pedidos**  
✔ Redução da burocracia através de uma solução **100% digital**  
✔ Facilidade de escalabilidade e acesso remoto  

---

## 🚀 Como Executar o Projeto  
```bash
### **1️⃣ Criar a Infraestrutura no Azure**  

az login
az group create --name LogiMoveRG --location eastus
az vm create --name LogiMoveVM --resource-group LogiMoveRG --image UbuntuLTS --admin-username azureuser --generate-ssh-keys
---

```
```bash
2️⃣ Configurar Segurança
bash
Copiar
Editar
az network nsg rule create --resource-group LogiMoveRG --nsg-name LogiMoveNSG --name AllowSSH --protoco

```
```sql
3️⃣ Criar e Configurar o Banco de Dados
Copiar
Editar
CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    OriginCity VARCHAR(255)
);
```
## **✅ Resultados Esperados**
✔ **Infraestrutura criada e configurada no Azure.**

✔ **Banco de dados SQL funcional e seguro.**

✔ **Regras de rede aplicadas corretamente.**

✔ **Aplicação web implantada com sucesso.**

✔ **Operações CRUD funcionando no banco de dados.**

## **📝 Conclusão**
- Este projeto demonstra na prática como utilizar Microsoft Azure para criar uma infraestrutura escalável e segura, reforçando conceitos fundamentais -     para um desenvolvedor fullstack cloud-ready.
- Seja bem-vindo ao futuro da computação em nuvem! 🚀☁

## **📌 Autor**

![Image](https://github.com/user-attachments/assets/19cd2137-dcd7-41e5-9bd3-51d047449849)





