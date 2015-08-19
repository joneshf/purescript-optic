## Module Optic.Iso

#### `iso`

``` purescript
iso :: forall f p s t a b. (Profunctor p, Functor f) => (s -> a) -> (b -> t) -> p a (f b) -> p s (f t)
```

#### `from`

``` purescript
from :: forall f p s t a b. (Profunctor p, Functor f) => AnIso s t a b -> p t (f s) -> p b (f a)
```

#### `withIso`

``` purescript
withIso :: forall b r a t s. AnIso s t a b -> ((s -> a) -> (b -> t) -> r) -> r
```

#### `cloneIso`

``` purescript
cloneIso :: forall f p s t a b. (Profunctor p, Functor f) => AnIso s t a b -> p a (f b) -> p s (f t)
```

#### `au`

``` purescript
au :: forall b e a t s. AnIso s t a b -> ((b -> t) -> e -> s) -> e -> a
```

#### `auf`

``` purescript
auf :: forall p s t a b e r. (Profunctor p) => AnIso s t a b -> (p r a -> e -> b) -> p r s -> e -> t
```

#### `under`

``` purescript
under :: forall s t a b. AnIso s t a b -> (t -> s) -> b -> a
```

#### `enum`

``` purescript
enum :: forall a. (Enum a, Monoid a) => IsoP Int a
```

#### `mapping`

``` purescript
mapping :: forall f g p s t a b. (Functor f, Functor g, Profunctor p) => AnIso s t a b -> p (f a) (f (g b)) -> p (f s) (f (g t))
```


