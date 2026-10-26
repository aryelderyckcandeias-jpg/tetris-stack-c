# Tetris Stack

Simulador no terminal, escrito em **C**, de uma **fila de peças futuras** e de uma **pilha de peças reservadas**, no estilo do Tetris. Serve para praticar **fila circular** e **pilha** com vetores.

> Trabalho acadêmico de estudo de estruturas de dados.

## Como funciona

- Cada peça (`Peca`) tem um tipo (`I`, `O`, `T` ou `L`) e um `id` único, gerados automaticamente.
- A **fila** começa com 5 peças e é reposta a cada peça jogada ou reservada.
- A **pilha de reserva** guarda até 3 peças.

| Opção | Ação |
| --- | --- |
| 1 | Jogar a peça da frente da fila (`dequeue`) e repor uma nova |
| 2 | Enviar a peça da frente para a pilha de reserva (`push`) |
| 3 | Usar a peça do topo da pilha (`pop`) |
| 4 | Trocar a peça da frente da fila com o topo da pilha |
| 5 | Trocar as 3 primeiras da fila com as 3 da pilha |
| 0 | Sair |

## Conceitos praticados

| Conceito | Onde aparece |
| --- | --- |
| Fila circular | `enqueue`/`dequeue`, com índices `front` e `rear` calculados com `%` |
| Pilha | `push`/`pop`, com o índice `top` |
| Structs | `Peca` |
| Números aleatórios | `rand()` e `srand(time(NULL))` em `gerarPeca` |
| Validação de limites | Mensagens de erro para fila ou pilha cheia/vazia |

## Como compilar e executar

Requisitos: `gcc` e `make` (Linux ou macOS). No Windows, use MinGW-w64 ou WSL.

```bash
make        # compila
make run    # compila e executa
make clean  # remove o binário
```

Sem `make`:

```bash
gcc -std=c11 -Wall -Wextra -o tetris_stack src/tetris_stack.c
./tetris_stack
```

## Exemplo de execução

Trecho após reservar duas peças (opção 2 duas vezes) e trocar a da frente com o topo (opção 4):

```text
Troca realizada: peça da frente da fila [L 2] com topo da pilha [O 1].
Estado atual:
Fila de peças	[O 1] [O 3] [L 4] [O 5] [T 6]
Pilha de reserva	(Topo -> base): [L 2] [O 0]
```

(Os tipos das peças mudam a cada execução porque são sorteados.)

## Estrutura do projeto

```text
.
├── src/
│   └── tetris_stack.c   # todo o código
├── Makefile
└── README.md
```

## Limitações conhecidas e próximos passos

- Uma entrada não numérica no menu (por exemplo, uma letra) faz o programa entrar em **loop infinito** repetindo a última opção, porque o `scanf("%d")` falha sem consumir a entrada. Próximo passo: ler a linha com `fgets` e converter com `strtol`.
- Ao reservar uma peça com a pilha cheia, a peça volta para o **fim** da fila (e não para a frente).
- A fila e a pilha são variáveis globais. Próximo passo: encapsular em structs e funções com ponteiros.
- Separar em `.h`/`.c` e adicionar testes automatizados para `enqueue`, `dequeue`, `push` e `pop`.
