## Module Optic.Traversal

#### `both`

``` purescript
both :: forall b a r. (Bitraversable r) => Traversal (r a a) (r b b) a b
```

#### `forOf`

``` purescript
forOf :: forall p f s t a b. Over p f s t a b -> s -> p a (f b) -> f t
```

#### `sequenceOf`

``` purescript
sequenceOf :: forall p f s t a b. LensLike f s t (f b) b -> s -> f t
```

#### `traverseOf`

``` purescript
traverseOf :: forall p f s t a b. Over p f s t a b -> p a (f b) -> s -> f t
```


