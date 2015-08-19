## Module Optic.Review

#### `(##)`

``` purescript
(##) :: forall s t a b. AReview s t a b -> b -> t
```

_right-associative / precedence 8_

#### `re`

``` purescript
re :: forall s t a b. AReview s t a b -> Getter b t
```

#### `reuse`

``` purescript
reuse :: forall m b a t s. (Monad m, MonadState b m) => AReview s t a b -> m t
```

#### `reuses`

``` purescript
reuses :: forall m b r a t s. (Monad m, MonadState b m) => AReview s t a b -> (t -> r) -> m r
```

#### `relook`

``` purescript
relook :: forall m b a t s. (Monad m, MonadReader b m) => AReview s t a b -> m t
```

#### `relooks`

``` purescript
relooks :: forall m b r a t s. (Monad m, MonadReader b m) => AReview s t a b -> (t -> r) -> m r
```

#### `unto`

``` purescript
unto :: forall p f s t a b. (Profunctor p, Bifunctor p, Functor f) => (b -> t) -> Optic p f s t a b
```

#### `un`

``` purescript
un :: forall p f s a. (Profunctor p, Bifunctor p, Functor f) => Getting a s a -> OpticP p f a s
```


