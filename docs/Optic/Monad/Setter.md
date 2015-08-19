## Module Optic.Monad.Setter

#### `assign`

``` purescript
assign :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a b -> b -> m Unit
```

#### `(%=)`

``` purescript
(%=) :: forall p b a m s. (Monad m, MonadState s m, Profunctor p) => Setting p s s a b -> p a b -> m Unit
```

_right-associative / precedence 4_

#### `(.=)`

``` purescript
(.=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a b -> b -> m Unit
```

_right-associative / precedence 4_

#### `(+=)`

``` purescript
(+=) :: forall s a m. (Monad m, MonadState s m, Semiring a) => ASetterP s a -> a -> m Unit
```

_right-associative / precedence 4_

#### `(-=)`

``` purescript
(-=) :: forall s a m. (Monad m, MonadState s m, Ring a) => ASetterP s a -> a -> m Unit
```

_right-associative / precedence 4_

#### `(*=)`

``` purescript
(*=) :: forall s a m. (Monad m, MonadState s m, Semiring a) => ASetterP s a -> a -> m Unit
```

_right-associative / precedence 4_

#### `(//=)`

``` purescript
(//=) :: forall s a m. (Monad m, MonadState s m, DivisionRing a) => ASetterP s a -> a -> m Unit
```

_right-associative / precedence 4_

#### `(||=)`

``` purescript
(||=) :: forall s a m. (Monad m, MonadState s m, BooleanAlgebra a) => ASetterP s a -> a -> m Unit
```

_right-associative / precedence 4_

#### `(&&=)`

``` purescript
(&&=) :: forall s a m. (Monad m, MonadState s m, BooleanAlgebra a) => ASetterP s a -> a -> m Unit
```

_right-associative / precedence 4_

#### `(<>=)`

``` purescript
(<>=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit
```

_right-associative / precedence 4_

#### `(++=)`

``` purescript
(++=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit
```

_right-associative / precedence 4_

#### `(?=)`

``` purescript
(?=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a (Maybe b) -> b -> m Unit
```

_right-associative / precedence 4_


