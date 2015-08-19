## Module Data.Tagged

#### `Tagged`

``` purescript
newtype Tagged s b
  = Tagged b
```

##### Instances
``` purescript
instance functorTagged :: Functor (Tagged s)
instance applyTagged :: Apply (Tagged s)
instance bindTagged :: Bind (Tagged s)
instance applicativeTagged :: Applicative (Tagged s)
instance monadTagged :: Monad (Tagged s)
instance extendTagged :: Extend (Tagged s)
instance comonadTagged :: Comonad (Tagged s)
instance semigroupTagged :: (Semigroup b) => Semigroup (Tagged s b)
instance monoidTagged :: (Monoid b) => Monoid (Tagged s b)
instance semigroupoidTagged :: Semigroupoid Tagged
instance foldableTagged :: Foldable (Tagged s)
instance traversableTagged :: Traversable (Tagged s)
instance bifunctorTagged :: Bifunctor Tagged
instance biapplyTagged :: Biapply Tagged
instance biapplicativeTagged :: Biapplicative Tagged
instance bifoldableTagged :: Bifoldable Tagged
instance bitraversableTagged :: Bitraversable Tagged
instance profunctorTagged :: Profunctor Tagged
instance choiceTagged :: Choice Tagged
```

#### `unTagged`

``` purescript
unTagged :: forall s b. Tagged s b -> b
```

#### `retag`

``` purescript
retag :: forall s t b. Tagged s b -> Tagged t b
```

#### `untag`

``` purescript
untag :: forall s b. Tagged s b -> b
```

#### `tagSelf`

``` purescript
tagSelf :: forall b. b -> Tagged b b
```

#### `untagSelf`

``` purescript
untagSelf :: forall b. Tagged b b -> b
```


