" Defining a Pair class "
Object subclass #Pair.
Pair instanceVariableNames: 'x y'.
Pair extend [
  getX [ ^x ]
  getY [ ^y ]
  setX: a [ x := a ]
  setY: b [ y := b ]
].

" Instanciating a class "
p := Pair new.
p setX: 100.
p setY: 'hello'.
p getX printNl.
p getY printNl.

" Inheritance with new syntax "
Pair subclass: Triple [
  | z |

  getZ [ ^z ]
  setZ: c [ z := c]
].

" Shorthand syntax for Instanciating "
t := Triple new setX: 3.14159; setY: $C; setZ: true.