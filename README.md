# Memory Management - Swift

O swift utiliza o Automatic Reference Counting (ARC) para gerenciar o quanto de memória o app está utilizando. 

A cada vez que é criada uma nova instância de uma classe o ARC aloca um pedaço da memória para armazenar essa informação. Quando a instancia não é mais necessária o ARC a remove da memória e evita com que o app utilize mais memória do que realmente precisa.

## Existem 3 tipos de variáveis na questão de gerenciamento de memória, são elas:

### Strong:
São as variáveis normais (var, let) e quando são instanciadas aumentam em 1 o contador do ARC dessa instancia.



Weak -> um tipo de variável que não segura uma instancia forte e pode ser desalocada se necessário.

Unowned -> parecido com a variável weak porem a principal diferença é que esse tipo de variável sempre garante um valor, ou seja, ele não pode ser optional.


Documentação oficial do Swift sobre gerenciamento de memória: https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html
