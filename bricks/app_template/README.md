# 🧱 app_template

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

Brick Mason para gerar um **projeto Flutter completo**, já estruturado com:
- arquitetura modular
- separação clara de responsabilidades
- setup de flavors (QA / Prod)
- base de estado, erro e networking pronta

Este brick **não gera só arquivos** — ele gera um **projeto pronto para escalar**.

---

## 🎯 O que esse brick gera?

Ao rodar:

```bash
mason make app_template
````

Será gerado um projeto Flutter com:

* estrutura `core / modules`
* arquitetura baseada em Clean adaptada para Flutter real
* `Result` + `Failure` para controle explícito de erro
* HTTP com Dio + interceptors
* Network checker
* BaseBloc, BaseState e UI Effects
* Flavors (QA / Prod)
* tema base configurado
* exemplo de feature (`home`) funcional

---

## 🧠 Quando usar este template?

Use este brick se você:

* cria vários apps Flutter
* não quer decidir arquitetura toda vez
* quer previsibilidade no crescimento do projeto
* prefere erros explícitos em vez de exceptions soltas
* trabalha com times ou projetos de médio/grande porte

❌ **Não é indicado** para:

* POCs extremamente simples
* apps de 1 tela sem backend
* projetos sem necessidade de escalabilidade

---

## 📦 Pré-requisitos

Antes de usar este brick, você precisa ter instalado:

* Dart SDK
* Flutter (qualquer versão inicial)
* Mason CLI

```bash
dart pub global activate mason_cli
```

---

## 🛠️ Como usar

### 1️⃣ Inicializar o Mason (se necessário)

```bash
mason init
```

---

### 2️⃣ Adicionar o brick

```bash
mason add app_template \
  --git-url https://github.com/SEU_USUARIO/SEU_REPO_TEMPLATE.git \
  --git-path bricks/app_template
```

Depois:

```bash
mason get
```

---

### 3️⃣ Gerar o projeto

```bash
mason make app_template
```

Siga os prompts do Mason (nome do projeto, etc).

---

### 4️⃣ Após gerar o projeto

Entre na pasta gerada e siga o README principal do projeto para:

* configurar FVM
* instalar dependências
* rodar o app
* buildar com flavors

👉 O README do projeto gerado contém o setup completo.

---

## 🧱 Estrutura gerada (resumo)

```
lib/
 ├── core/
 │   ├── config
 │   ├── di
 │   ├── foundation
 │   ├── infra
 │   └── ui
 ├── modules/
 │   └── home/
 ├── app.dart
 ├── main_qa.dart
 └── main_prod.dart
```

Cada feature é isolada e segue o mesmo padrão.

---

## 📘 Guia de Features

Após gerar o projeto, **toda nova feature deve seguir o guia oficial**:

👉 **Guia de Criação de Features**
(consulte o `FEATURE_GUIDE.md` no projeto gerado)

Esse guia explica:

* como criar uma feature do zero
* onde colocar cada arquivo
* regras de dependência entre camadas
* checklist de revisão

---

## 🧠 Filosofia do brick

* menos mágica
* mais clareza
* estrutura previsível
* fácil de manter e remover features
* pronto para crescer sem refatoração traumática

---

## 🔗 Mason

Este brick foi criado usando o [Mason CLI](https://github.com/felangel/mason).

Se você nunca usou Mason:

* [https://docs.brickhub.dev](https://docs.brickhub.dev)

---

🧱 **Generated with Mason, but designed for real projects.**

```
