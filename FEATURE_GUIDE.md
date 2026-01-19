# 📘 Guia de Criação de Features

Este guia explica **como criar uma nova feature** seguindo a arquitetura do template, mantendo consistência e evitando acoplamento desnecessário.

A ideia é que **toda feature siga o mesmo padrão**, do backend fake ao UI.

---

## 📂 Estrutura básica de uma feature

Toda feature deve ficar dentro de:

```
lib/modules/
```

Exemplo de feature `profile`:

```
lib/modules/profile/
 ├── data/
 ├── domain/
 ├── ui/
 └── profile_module.dart
```

---

## 1️⃣ Criar a pasta da feature

```
lib/modules/profile/
```

E o arquivo do módulo:

```dart
profile_module.dart
```

---

## 2️⃣ Domain (regra de negócio)

O **Domain não conhece Flutter, Dio, UI ou Modular**.

### 📂 `domain/entities`

Modelo de negócio:

```dart
class ProfileEntity {
  final String name;
  final String email;

  const ProfileEntity({
    required this.name,
    required this.email,
  });
}
```

---

### 📂 `domain/params`

Parâmetros de entrada dos casos de uso:

```dart
class GetProfileParams {
  final String userId;

  const GetProfileParams(this.userId);
}
```

---

### 📂 `domain/repositories`

Contrato do repositório:

```dart
abstract class IProfileRepository {
  Future<Result<Failure, ProfileEntity>> getProfile(GetProfileParams params);
}
```

---

### 📂 `domain/usecases`

Caso de uso:

```dart
class GetProfileUsecase
    extends UseCase<GetProfileParams, ProfileEntity> {
  final IProfileRepository repository;

  GetProfileUsecase(this.repository);

  @override
  Future<Result<Failure, ProfileEntity>> call(GetProfileParams params) {
    return repository.getProfile(params);
  }
}
```

---

## 3️⃣ Data (acesso a dados)

Aqui ficam **DTOs, API, cache, etc**.

### 📂 `data/models`

Modelo de API:

```dart
class ProfileModel {
  final String name;
  final String email;

  ProfileModel({
    required this.name,
    required this.email,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'],
      email: map['email'],
    );
  }

  ProfileEntity toEntity() =>
      ProfileEntity(name: name, email: email);
}
```

---

### 📂 `data/datasources`

Datasource (HTTP, por exemplo):

```dart
abstract class IProfileDatasource {
  Future<Map<String, dynamic>> getProfile(String userId);
}
```

Implementação:

```dart
class ProfileDatasourceImpl implements IProfileDatasource {
  final IHttp http;

  ProfileDatasourceImpl(this.http);

  @override
  Future<Map<String, dynamic>> getProfile(String userId) async {
    final response = await http.get('/profile/$userId');
    return response.data;
  }
}
```

---

### 📂 `data/repositories`

Implementação do repositório:

```dart
class ProfileRepositoryImpl implements IProfileRepository {
  final IProfileDatasource datasource;

  ProfileRepositoryImpl(this.datasource);

  @override
  Future<Result<Failure, ProfileEntity>> getProfile(
    GetProfileParams params,
  ) async {
    final result = await datasource.getProfile(params.userId);
    final model = ProfileModel.fromMap(result);
    return Right(model.toEntity());
  }
}
```

---

## 4️⃣ UI (estado e tela)

### 📂 `ui/state`

Bloc e State da feature:

```dart
class ProfileState extends BaseState<ProfileState> {
  final ProfileEntity? profile;

  const ProfileState({
    super.isLoading,
    super.failure,
    this.profile,
  });

  factory ProfileState.initial() => const ProfileState();

  @override
  ProfileState copyWith({
    bool? isLoading,
    FailureState? failure,
    ProfileEntity? profile,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure ?? this.failure,
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [isLoading, failure, profile];
}
```

---

### 📂 `ui/state`

Bloc:

```dart
class ProfileBloc extends BaseBloc<ProfileState> {
  final GetProfileUsecase getProfile;

  ProfileBloc(this.getProfile) : super(ProfileState.initial());

  Future<void> loadProfile(String userId) async {
    updateLoading(true);

    final result = await getProfile(GetProfileParams(userId));

    updateLoading(false);

    result.fold(
      (failure) => handleFailureFrom(
        FailureState.of(failure.message),
        asSnackbar: false,
      ),
      (profile) => emit(
        state.copyWith(profile: profile),
      ),
    );
  }
}
```

---

### 📂 `ui/pages`

Tela:

```dart
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocView<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return AppScaffold(
          title: 'Profile',
          isLoading: state.isLoading,
          failure: state.failure,
          body: Text(state.profile?.name ?? ''),
        );
      },
    );
  }
}
```

---

## 5️⃣ Registrar no módulo

### `profile_module.dart`

```dart
class ProfileModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..add<IProfileDatasource>(ProfileDatasourceImpl.new)
      ..add<IProfileRepository>(ProfileRepositoryImpl.new)
      ..add(GetProfileUsecase.new)
      ..add(ProfileBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/profile',
      child: (_) => const ProfilePage(),
    );
  }
}
```

---

## 6️⃣ Adicionar o módulo no app

No `app_module.dart`:

```dart
imports: [
  ProfileModule(),
],
```

---

## 🧠 Regras importantes (leia isso)

* UI **nunca** chama datasource
* Bloc **nunca** chama HTTP direto
* Domain **não conhece Flutter**
* `Result` sempre atravessa camadas
* `Failure` chega até a UI
* Tudo que afeta UI entra no `props`

---

## 🎯 Checklist rápido de feature

* [ ] Tem `domain`?
* [ ] Tem `usecase`?
* [ ] Repository é interface no domain?
* [ ] RepositoryImpl fica em data?
* [ ] Bloc só fala com UseCase?
* [ ] State tem `props` corretos?
* [ ] Módulo registrado?

---

## 🧠 Filosofia

> **Uma feature deve ser fácil de apagar.**

Se remover a pasta inteira:

```
lib/modules/profile
```

O resto do app **não deve quebrar**.

