# SB_nasm
Trabalhinhos de nasm de Software Básico.
Tudo foi feito baseado em processadores com arquitetura de 64 bits

## Instalação
### Ubuntu

Instale o nasm e o gcc
```sh
sudo apt-get install nasm
sudo apt-get install gcc
```

### Windows
1. Instale o WSL 2 e uma distribuição do Ubuntu.
2. Abra o ubuntu e instale o nasm e o gcc com os comandos abaixo:
```sh
sudo apt-get install nasm
sudo apt-get install gcc
```

## Execução
Na primeira execução é necessário criar pastas para gerar os executáveis. Para isso execute os seguintes comandos dentro da pasta do projeto clonado:

```shell
mkdir exe
mkdir obj 
```

Para executar cada um dos exemplos basta executar o comando abaixo trocando <name> pelo nome do arquivo:
```shell
nasm -felf64 <name>.asm -o ./obj/<name>.o && gcc ./obj/<name>.o -o ./exe/<name>.exe && ./exe/<name>.exe
```