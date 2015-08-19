## Module Optic.Fold

#### `filtered`

``` purescript
filtered :: forall f a p. (Applicative f, Choice p) => (a -> Boolean) -> OpticP p f a a
```

#### `foldOf`

``` purescript
foldOf :: forall a s. Getting a s a -> s -> a
```

#### `foldrOf`

``` purescript
foldrOf :: forall r a s p. (Profunctor p) => Accessing p (Endo r) s a -> p a (r -> r) -> r -> s -> r
```

#### `foldlOf`

``` purescript
foldlOf :: forall r a s. Getting (Dual (Endo r)) s a -> (r -> a -> r) -> r -> s -> r
```

#### `foldMapOf`

``` purescript
foldMapOf :: forall r a s p. (Profunctor p) => Accessing p r s a -> p a r -> s -> r
```

#### `has`

``` purescript
has :: forall b a s. (BooleanAlgebra b) => Getting (Disj b) s a -> s -> b
```

#### `hasn't`

``` purescript
hasn't :: forall b a s. (BooleanAlgebra b) => Getting (Conj b) s a -> s -> b
```

#### `toListOf`

``` purescript
toListOf :: forall a s. Getting (Endo (List a)) s a -> s -> List a
```

#### `(^..)`

``` purescript
(^..) :: forall a s. s -> Getting (Endo (List a)) s a -> List a
```

_left-associative / precedence 8_

#### `(^?)`

``` purescript
(^?) :: forall a s. s -> Getting (First a) s a -> Maybe a
```

_left-associative / precedence 8_


