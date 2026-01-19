# 🚀 Flutter Template

Template Flutter opinativo, modular e pragmático, focado em:
- organização
- previsibilidade
- escalabilidade
- menos decisões repetidas por projeto

Este template **não automatiza tudo de forma mágica** de propósito.  
A ideia é que o desenvolvedor **entenda o fluxo** e tenha controle total do ambiente.

---

## 🧱 Tecnologias e padrões

- Flutter (via FVM)
- Mason (geração de projeto)
- Just (atalhos de comandos)
- Bloc (state management)
- Result / Failure (controle explícito de erro)
- Dio (HTTP)
- Flutter Modular (DI e rotas)
- Flavors (QA / Prod)

---

## 📋 Pré-requisitos

Antes de começar, você precisa ter instalado:

- Git
- Dart SDK
- Flutter (qualquer versão inicial — o FVM vai gerenciar depois)

---

## 🔧 Instalação das ferramentas

### 🪟 Windows

#### 1. Mason
```powershell
dart pub global activate mason_cli
````

#### 2. FVM

```powershell
dart pub global activate fvm
```

#### 3. Just

```powershell
winget install --id Casey.Just --exact
```

Feche e reabra o terminal após a instalação.

---

### 🍎 macOS

#### 1. Mason

```bash
dart pub global activate mason_cli
```

#### 2. FVM

```bash
dart pub global activate fvm
```

#### 3. Just

```bash
brew install just
```

---

## 🧬 Configurar Flutter com FVM

Na raiz do projeto (ou do projeto gerado):

```bash
fvm use stable
```

Isso irá:

* baixar o Flutter stable
* criar o `fvm_config.json`
* travar a versão do Flutter para o projeto

> ⚠️ A partir daqui, **sempre use `fvm flutter`**, nunca `flutter` direto.

Exemplo:

```bash
fvm flutter pub get
```

---

## 🧱 Mason – baixar o template

### Se o projeto **já possui `mason.yaml`**

Basta rodar:

```bash
mason get
```

---

### Se o projeto **ainda não possui `mason.yaml`**

```bash
mason init
```

Depois, adicione o template:

```bash
mason add app_template \
  --git-url https://github.com/SEU_USUARIO/SEU_REPO_TEMPLATE.git \
  --git-path bricks/app_template
```

E então:

```bash
mason get
```

---

## 🏗️ Gerar o projeto

```bash
mason make app_template
```

O Mason irá copiar **somente o conteúdo da pasta `__brick__`** e gerar o projeto Flutter completo.

Entre na pasta gerada:

```bash
cd nome_do_projeto
```

---

## 📦 Instalar dependências do app

```bash
fvm flutter pub get
```

---

## 🧰 Usando o Just

Para ver os comandos disponíveis:

```bash
just --list
```

Exemplos comuns:

```bash
just clean
just get
just apk-qa
just bundle-prod
```

Todos os comandos do `justfile` utilizam `fvm flutter` internamente.

---

## ▶️ Rodar o app

### QA

```bash
fvm flutter run --flavor qa -t lib/main_qa.dart
```

### Produção

```bash
fvm flutter run --flavor prod -t lib/main_prod.dart
```

---

# 🧠 Arquitetura do Projeto

Este template segue uma arquitetura **modular**, inspirada em Clean Architecture, porém **adaptada para Flutter real**, evitando complexidade desnecessária.

O foco é:

* separar responsabilidades
* isolar features
* facilitar manutenção e crescimento

---

## 📦 Visão geral

```
lib/
 ├── core/
 ├── modules/
 ├── app.dart
 ├── main_common.dart
 ├── main_qa.dart
 └── main_prod.dart
```

* `core`: código compartilhado e infraestrutura do app
* `modules`: features isoladas
* `main_*`: entrypoints por flavor

---

## 🧩 Core

Tudo em `core/` é **agnóstico de feature** e reutilizável.

### `core/config`

Configurações globais:

* URLs
* paths
* flavors
* leitura de env

---

### `core/di`

Injeção de dependências com `flutter_modular`.

* dependências globais (HTTP, log, navegação)
* cada módulo registra apenas o que é dele

---

### `core/foundation`

Base conceitual do projeto.

```
foundation/
 ├── result/
 ├── error/
 ├── contracts/
 └── usecase/
```

* `Result<Failure, T>`: controle explícito de sucesso/erro
* `Failure`: erro de domínio/apresentação
* `UseCase`: padronização de regras de negócio

👉 Não depende de Flutter nem de infra.

---

### `core/infra`

Implementações técnicas.

```
infra/
 ├── http/
 ├── log/
 ├── navigation/
 └── repositories/
```

* Dio
* interceptors
* RequestHandler
* NetworkChecker
* Logger

👉 Infra depende de Foundation, nunca o contrário.

---

### `core/ui`

Infraestrutura de UI compartilhada.

```
ui/
 ├── state_management/
 ├── theme/
 └── widgets/
```

* BaseBloc / BaseState
* UiEffect (snackbar, navegação, etc)
* temas e widgets comuns

---

### `core/routing`

Definição de rotas globais do app.

---

## 📦 Modules (Features)

Cada feature vive isolada dentro de `modules/`.

Exemplo: `modules/home`

```
home/
 ├── data/
 ├── domain/
 ├── ui/
 └── home_module.dart
```

---

### `data`

Acesso a dados:

* datasources (API, cache)
* models (DTOs)
* repositories (implementações)

---

### `domain`

Regra de negócio pura:

* entities
* params
* repositories (interfaces)
* usecases

👉 Não depende de Flutter, Dio ou UI.

---

### `ui`

Interface da feature:

* pages
* bloc + state

UI conversa **somente com UseCases**.

---

## 🔄 Fluxo de dados

```
UI
 ↓
Bloc
 ↓
UseCase
 ↓
Repository (interface)
 ↓
RepositoryImpl
 ↓
Datasource
 ↓
HTTP / Cache
```

Retorno sempre via:

```
Result<Failure, T>
```

Sem exceptions escapando para a UI.

---

## 🎯 Decisões arquiteturais

### Por que `infra` fica dentro de `core`?

Porque é infraestrutura do **app**, não de uma feature específica.

---

### Por que usar `Result` em vez de exceptions?

* fluxo explícito
* fácil de testar
* UI decide como reagir ao erro

---

### Por que separar `Failure` de `Exception`?

* `Exception` = erro técnico
* `Failure` = erro de negócio/apresentação

---

### Por que BaseBloc / BaseState?

* reduz boilerplate
* padroniza loading, erro e efeitos
* facilita consistência entre features

---

## 🧠 Filosofia do template

* menos mágica
* mais clareza
* erros explícitos
* estrutura previsível
* fácil de adaptar para projetos grandes

---

## 📌 Observação final

Este template é **opinativo** por design.
A ideia não é agradar todos os estilos, e sim fornecer uma base sólida para projetos reais.

---

