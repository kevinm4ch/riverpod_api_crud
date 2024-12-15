# riverpod_api_crud

Projeto de CRUD usando riverpod para genrenciar o estado de uma lista de tarefas

## Para começar

Para testar o projeto é necessário instalar o pacote [json_rest_server](https://pub.dev/packages/json_rest_server) que vai nos permitir utitlizar uma API a partir de um arquivo json.

### Instalando o json_rest_server
- Abra o terminal na pasta do projeto e digite o comando
```
dart pub global activate json_rest_server
```
- No linux é necessário adicionar o executável ao PATH
```
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

### Criando a pasta do backend
- Crie o ambiente do backend usando o json_rest_server
```
jrs create backend
cd backend
```
### Alterando o database.json
- Dentro da pasta backend, abra o arquivo database.json, apague todo o seu conteúdo e cole o conteúdo abaixo
```
{
    "todo": []
}
```
### Iniciando o servidor
- Para iniciar o servidor, no terminal, digite os comando abaixo
```
cd backend
jrs run
```
