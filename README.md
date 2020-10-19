# projeto rdb-frontend-flutter

Este projeto usa Flutter, um framework da linguagem Dart.

## Pre requisitos
* Dart 2.11
* Flutter 1.23

Se você quiser saber mais sobre a Flutter, visite seu site: http://flutter.dev/.

## Executando o aplicativo

Você pode executar seu aplicativo em qualquer sistema operacional com ambiente de desolvimento configurado, por exemplo Android, iOS, Linux, Windows e MacOS. Usando o comando: 
```
flutter run
```

O aplicativo para ser usado é necessário o servidor (backend) rodando no endpoint `http:\\localhost:8080`. Veja sobre o backend nesse link https://github.com/leandrorochaadm/rdb-backend-quarkus

## Criação de um executável nativo Windows

É necessário configurar o ambiente:
 ```
 flutter config --enable-windows-desktop
 ```

Você pode criar um executável nativo usando 
```
flutter build windows
```

Ele produz o arquivo `rdb.exe` no diretório `\build\windows\runner\Release`.
Esteja ciente de que não é um único executavel, pois as dependências e dll estão no diretório `\build\windows\runner\Release`.



## Criação de um executável nativo Linux

É necessário configurar o ambiente 
```
flutter config --enable-linux-desktop
````

Você pode criar um executável nativo usando 
```
flutter build linux
```



Se você quiser saber mais sobre como construir executáveis ​​nativos, consulte https://flutter.dev/desktop.