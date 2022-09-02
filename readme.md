# Explicação

Este projeto tem como propósito reproduzir o problema que venho enfrentado para rodar imagens docker baseadas no Windows (especificamente o nanoserver)

O código fonte deste projeto é uma simples aplicação C# que expõe um endpoint em `http://localhost:5000/Index` 

O arquivo `dockerfile` deste projeto é bem simples: 

* Baixa as dependências
* Compila o código fonte
* Gera os artefatos
* Inicia a aplicação na porta 5000

# O problema

Se usarmos uma imagem base do Linux (como o bullseye-slim por exemplo) o docker funciona certinho, mas se usarmos uma imagem base do Windows (como o nanoserver por exemplo) há o seguinte erro ao montar a imagem:

```none
open /var/lib/docker/overlay2/defc6743756368a4bdf8cf54379db50a8e1edb012daee1f41a45612d1eacaa12/merged/etc/passwd: no such file or directory
```
