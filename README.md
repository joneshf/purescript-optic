# Module Documentation

## Module Data.Tagged

#### `Tagged`

``` purescript
newtype Tagged s b
  = Tagged b
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


#### `functorTagged`

``` purescript
instance functorTagged :: Functor (Tagged s)
```


#### `applyTagged`

``` purescript
instance applyTagged :: Apply (Tagged s)
```


#### `bindTagged`

``` purescript
instance bindTagged :: Bind (Tagged s)
```


#### `applicativeTagged`

``` purescript
instance applicativeTagged :: Applicative (Tagged s)
```


#### `monadTagged`

``` purescript
instance monadTagged :: Monad (Tagged s)
```


#### `extendTagged`

``` purescript
instance extendTagged :: Extend (Tagged s)
```


#### `comonadTagged`

``` purescript
instance comonadTagged :: Comonad (Tagged s)
```


#### `semigroupTagged`

``` purescript
instance semigroupTagged :: (Semigroup b) => Semigroup (Tagged s b)
```


#### `monoidTagged`

``` purescript
instance monoidTagged :: (Monoid b) => Monoid (Tagged s b)
```


#### `semigroupoidTagged`

``` purescript
instance semigroupoidTagged :: Semigroupoid Tagged
```


#### `foldableTagged`

``` purescript
instance foldableTagged :: Foldable (Tagged s)
```


#### `traversableTagged`

``` purescript
instance traversableTagged :: Traversable (Tagged s)
```


#### `bifunctorTagged`

``` purescript
instance bifunctorTagged :: Bifunctor Tagged
```


#### `biapplyTagged`

``` purescript
instance biapplyTagged :: Biapply Tagged
```


#### `biapplicativeTagged`

``` purescript
instance biapplicativeTagged :: Biapplicative Tagged
```


#### `bifoldableTagged`

``` purescript
instance bifoldableTagged :: Bifoldable Tagged
```


#### `bitraversableTagged`

``` purescript
instance bitraversableTagged :: Bitraversable Tagged
```


#### `profunctorTagged`

``` purescript
instance profunctorTagged :: Profunctor Tagged
```


#### `choiceTagged`

``` purescript
instance choiceTagged :: Choice Tagged
```



## Module Optic.Equality

#### `simple`

``` purescript
simple :: forall a. EqualityP a a
```


#### `simply`

``` purescript
simply :: forall p f s a r. (OpticP p f s a -> r) -> OpticP p f s a -> r
```



## Module Optic.Extended

#### `AnIso`

``` purescript
type AnIso s t a b = OTE.AnIso s t a b
```

#### `AnIsoP`

``` purescript
type AnIsoP s a = OTE.AnIsoP s a
```


#### `AReview`

``` purescript
type AReview s t a b = OTE.AReview s t a b
```


#### `AReviewP`

``` purescript
type AReviewP t b = OTE.AReviewP t b
```


#### `Equality`

``` purescript
type Equality s t a b = OTE.Equality s t a b
```


#### `EqualityP`

``` purescript
type EqualityP s a = OTE.EqualityP s a
```


#### `Iso`

``` purescript
type Iso s t a b = OTE.Iso s t a b
```


#### `IsoP`

``` purescript
type IsoP s a = OTE.IsoP s a
```


#### `LensLike`

``` purescript
type LensLike f s t a b = OTE.LensLike f s t a b
```


#### `LensLikeP`

``` purescript
type LensLikeP f s a = OTE.LensLikeP f s a
```


#### `Optic`

``` purescript
type Optic p f s t a b = OTE.Optic p f s t a b
```


#### `OpticP`

``` purescript
type OpticP p f s a = OTE.OpticP p f s a
```


#### `Over`

``` purescript
type Over p f s t a b = OTE.Over p f s t a b
```


#### `OverP`

``` purescript
type OverP p f s a = OTE.OverP p f s a
```


#### `Review`

``` purescript
type Review s t a b = OTE.Review s t a b
```


#### `ReviewP`

``` purescript
type ReviewP t b = OTE.ReviewP t b
```


#### `Traversal`

``` purescript
type Traversal s t a b = OTE.Traversal s t a b
```


#### `TraversalP`

``` purescript
type TraversalP s a = OTE.TraversalP s a
```



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
has :: forall a s. Getting Any s a -> s -> Boolean
```


#### `hasn't`

``` purescript
hasn't :: forall a s. Getting All s a -> s -> Boolean
```


#### `toListOf`

``` purescript
toListOf :: forall a s. Getting (Endo [a]) s a -> s -> [a]
```


#### `(^..)`

``` purescript
(^..) :: forall a s. s -> Getting (Endo [a]) s a -> [a]
```


#### `(^?)`

``` purescript
(^?) :: forall a s. s -> Getting (First a) s a -> Maybe a
```



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
enum :: forall a. (Enum a, Monoid a) => IsoP Number a
```


#### `mapping`

``` purescript
mapping :: forall f g p s t a b. (Functor f, Functor g, Profunctor p) => AnIso s t a b -> p (f a) (f (g b)) -> p (f s) (f (g t))
```



## Module Optic.Monad

#### `(#~)`

``` purescript
(#~) :: forall a s. s -> State s a -> s
```



## Module Optic.Review

#### `(##)`

``` purescript
(##) :: forall s t a b. AReview s t a b -> b -> t
```


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
unto :: forall p f s t a b. (Profunctor p, B.Bifunctor p, Functor f) => (b -> t) -> Optic p f s t a b
```


#### `un`

``` purescript
un :: forall p f s a. (Profunctor p, B.Bifunctor p, Functor f) => Getting a s a -> OpticP p f a s
```



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



## Module Optic.Internal.Iso

#### `Exchange`

``` purescript
data Exchange a b s t
  = Exchange (s -> a) (b -> t)
```


#### `functorExchange`

``` purescript
instance functorExchange :: Functor (Exchange a b s)
```


#### `profunctorExchange`

``` purescript
instance profunctorExchange :: Profunctor (Exchange a b)
```



## Module Optic.Monad.Getter

#### `use`

``` purescript
use :: forall s a m. (Monad m, MonadState s m) => Getting a s a -> m a
```


#### `look`

``` purescript
look :: forall r a m. (Monad m, MonadReader r m) => Getting a r a -> m a
```



## Module Optic.Monad.Setter

#### `assign`

``` purescript
assign :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a b -> b -> m Unit
```


#### `(%=)`

``` purescript
(%=) :: forall p b a m s. (Monad m, MonadState s m, Profunctor p) => Setting p s s a b -> p a b -> m Unit
```

#### `(.=)`

``` purescript
(.=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a b -> b -> m Unit
```


#### `(+=)`

``` purescript
(+=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit
```


#### `(-=)`

``` purescript
(-=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit
```


#### `(*=)`

``` purescript
(*=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit
```


#### `(//=)`

``` purescript
(//=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit
```


#### `(||=)`

``` purescript
(||=) :: forall s a m. (Monad m, MonadState s m, BoolLike a) => ASetterP s a -> a -> m Unit
```


#### `(&&=)`

``` purescript
(&&=) :: forall s a m. (Monad m, MonadState s m, BoolLike a) => ASetterP s a -> a -> m Unit
```


#### `(<>=)`

``` purescript
(<>=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit
```


#### `(++=)`

``` purescript
(++=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit
```


#### `(?=)`

``` purescript
(?=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a (Maybe b) -> b -> m Unit
```



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




