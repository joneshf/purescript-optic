## Module Optic.Internal.Iso

#### `Exchange`

``` purescript
data Exchange a b s t
  = Exchange (s -> a) (b -> t)
```

##### Instances
``` purescript
instance functorExchange :: Functor (Exchange a b s)
instance profunctorExchange :: Profunctor (Exchange a b)
```


