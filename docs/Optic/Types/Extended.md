## Module Optic.Types.Extended

#### `AnIso`

``` purescript
type AnIso s t a b = Exchange a b a (Identity b) -> Exchange a b s (Identity t)
```

#### `AnIsoP`

``` purescript
type AnIsoP s a = AnIso s s a a
```

#### `AReview`

``` purescript
type AReview s t a b = Optic Tagged Identity s t a b
```

#### `AReviewP`

``` purescript
type AReviewP t b = AReview t t b b
```

#### `Equality`

``` purescript
type Equality s t a b = forall f p. p a (f b) -> p s (f t)
```

#### `EqualityP`

``` purescript
type EqualityP s a = Equality s s a a
```

#### `Iso`

``` purescript
type Iso s t a b = forall p f. (Functor f, Profunctor p) => p a (f b) -> p s (f t)
```

#### `IsoP`

``` purescript
type IsoP s a = Iso s s a a
```

#### `LensLike`

``` purescript
type LensLike f s t a b = (a -> f b) -> s -> f t
```

#### `LensLikeP`

``` purescript
type LensLikeP f s a = LensLike f s s a a
```

#### `Optic`

``` purescript
type Optic p f s t a b = p a (f b) -> p s (f t)
```

#### `OpticP`

``` purescript
type OpticP p f s a = Optic p f s s a a
```

#### `Over`

``` purescript
type Over p f s t a b = p a (f b) -> s -> f t
```

#### `OverP`

``` purescript
type OverP p f s a = Over p f s s a a
```

#### `Review`

``` purescript
type Review s t a b = forall p f. (Bifunctor p, Profunctor p, Settable f) => Optic p f s t a b
```

#### `ReviewP`

``` purescript
type ReviewP t b = Review t t b b
```

#### `Traversal`

``` purescript
type Traversal s t a b = forall f. (Applicative f) => (a -> f b) -> s -> f t
```

#### `TraversalP`

``` purescript
type TraversalP s a = Traversal s s a a
```


