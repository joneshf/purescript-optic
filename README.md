# Module Documentation

## Module Data.Tagged

### Types

    newtype Tagged s b where
      Tagged :: b -> Tagged


### Type Class Instances

    instance applicativeTagged :: Applicative (Tagged s)

    instance applyTagged :: Apply (Tagged s)

    instance biapplicativeTagged :: Biapplicative Tagged

    instance biapplyTagged :: Biapply Tagged

    instance bifoldableTagged :: Bifoldable Tagged

    instance bifunctorTagged :: Bifunctor Tagged

    instance bindTagged :: Bind (Tagged s)

    instance bitraversableTagged :: Bitraversable Tagged

    instance choiceTagged :: Choice Tagged

    instance comonadTagged :: Comonad (Tagged s)

    instance extendTagged :: Extend (Tagged s)

    instance foldableTagged :: Foldable (Tagged s)

    instance functorTagged :: Functor (Tagged s)

    instance monadTagged :: Monad (Tagged s)

    instance monoidTagged :: (Monoid b) => Monoid (Tagged s b)

    instance profunctorTagged :: Profunctor Tagged

    instance semigroupTagged :: (Semigroup b) => Semigroup (Tagged s b)

    instance semigroupoidTagged :: Semigroupoid Tagged

    instance traversableTagged :: Traversable (Tagged s)


### Values

    retag :: forall s t b. Tagged s b -> Tagged t b

    tagSelf :: forall b. b -> Tagged b b

    unTagged :: forall s b. Tagged s b -> b

    untag :: forall s b. Tagged s b -> b

    untagSelf :: forall b. Tagged b b -> b


## Module Optic.Equality

### Values

    simple :: forall a. EqualityP a a

    simply :: forall p f s a r. (OpticP p f s a -> r) -> OpticP p f s a -> r


## Module Optic.Extended

### Types

    type AReview s t a b = OTE.AReview s t a b

    type AReviewP t b = OTE.AReviewP t b

    type AnIso s t a b = OTE.AnIso s t a b

    type AnIsoP s a = OTE.AnIsoP s a

    type Equality s t a b = OTE.Equality s t a b

    type EqualityP s a = OTE.EqualityP s a

    type Iso s t a b = OTE.Iso s t a b

    type IsoP s a = OTE.IsoP s a

    type LensLike f s t a b = OTE.LensLike f s t a b

    type LensLikeP f s a = OTE.LensLikeP f s a

    type Optic p f s t a b = OTE.Optic p f s t a b

    type OpticP p f s a = OTE.OpticP p f s a

    type Over p f s t a b = OTE.Over p f s t a b

    type OverP p f s a = OTE.OverP p f s a

    type Review s t a b = OTE.Review s t a b

    type ReviewP t b = OTE.ReviewP t b

    type Traversal s t a b = OTE.Traversal s t a b

    type TraversalP s a = OTE.TraversalP s a


## Module Optic.Fold

### Values

    (^..) :: forall a s. s -> Getting (Endo [a]) s a -> [a]

    (^?) :: forall a s. s -> Getting (First a) s a -> Maybe a

    filtered :: forall f a p. (Applicative f, Choice p) => (a -> Boolean) -> OpticP p f a a

    foldMapOf :: forall r a s p. (Profunctor p) => Accessing p r s a -> p a r -> s -> r

    foldOf :: forall a s. Getting a s a -> s -> a

    foldlOf :: forall r a s. Getting (Dual (Endo r)) s a -> (r -> a -> r) -> r -> s -> r

    foldrOf :: forall r a s p. (Profunctor p) => Accessing p (Endo r) s a -> p a (r -> r) -> r -> s -> r

    has :: forall a s. Getting Any s a -> s -> Boolean

    hasn't :: forall a s. Getting All s a -> s -> Boolean

    toListOf :: forall a s. Getting (Endo [a]) s a -> s -> [a]


## Module Optic.Iso

### Values

    au :: forall b e a t s. AnIso s t a b -> ((b -> t) -> e -> s) -> e -> a

    auf :: forall p s t a b e r. (Profunctor p) => AnIso s t a b -> (p r a -> e -> b) -> p r s -> e -> t

    cloneIso :: forall f p s t a b. (Profunctor p, Functor f) => AnIso s t a b -> p a (f b) -> p s (f t)

    enum :: forall a. (Enum a, Monoid a) => IsoP Number a

    from :: forall f p s t a b. (Profunctor p, Functor f) => AnIso s t a b -> p t (f s) -> p b (f a)

    iso :: forall f p s t a b. (Profunctor p, Functor f) => (s -> a) -> (b -> t) -> p a (f b) -> p s (f t)

    mapping :: forall f g p s t a b. (Functor f, Functor g, Profunctor p) => AnIso s t a b -> p (f a) (f (g b)) -> p (f s) (f (g t))

    under :: forall s t a b. AnIso s t a b -> (t -> s) -> b -> a

    withIso :: forall b r a t s. AnIso s t a b -> ((s -> a) -> (b -> t) -> r) -> r


## Module Optic.Review

### Types


### Values

    (##) :: forall s t a b. AReview s t a b -> b -> t

    re :: forall s t a b. AReview s t a b -> Getter b t

    relook :: forall m b a t s. (Monad m, MonadReader b m) => AReview s t a b -> m t

    relooks :: forall m b r a t s. (Monad m, MonadReader b m) => AReview s t a b -> (t -> r) -> m r

    reuse :: forall m b a t s. (Monad m, MonadState b m) => AReview s t a b -> m t

    reuses :: forall m b r a t s. (Monad m, MonadState b m) => AReview s t a b -> (t -> r) -> m r

    un :: forall p f s a. (Profunctor p, B.Bifunctor p, Functor f) => Getting a s a -> OpticP p f a s

    unto :: forall p f s t a b. (Profunctor p, B.Bifunctor p, Functor f) => (b -> t) -> Optic p f s t a b


## Module Optic.Traversal

### Values

    both :: forall b a r. (Bitraversable r) => Traversal (r a a) (r b b) a b

    forOf :: forall p f s t a b. Over p f s t a b -> s -> p a (f b) -> f t

    sequenceOf :: forall p f s t a b. LensLike f s t (f b) b -> s -> f t

    traverseOf :: forall p f s t a b. Over p f s t a b -> p a (f b) -> s -> f t


## Module Optic.Internal.Iso

### Types

    data Exchange a b s t where
      Exchange :: (s -> a) -> (b -> t) -> Exchange


### Type Class Instances

    instance functorExchange :: Functor (Exchange a b s)

    instance profunctorExchange :: Profunctor (Exchange a b)


## Module Optic.Monad.Getter

### Values

    look :: forall r a m. (Monad m, MonadReader r m) => Getting a r a -> m a

    use :: forall s a m. (Monad m, MonadState s m) => Getting a s a -> m a


## Module Optic.Monad.Setter

### Values

    (%=) :: forall p b a m s. (Monad m, MonadState s m, Profunctor p) => Setting p s s a b -> p a b -> m Unit

    (&&=) :: forall s a m. (Monad m, MonadState s m, BoolLike a) => ASetterP s a -> a -> m Unit

    (*=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit

    (++=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit

    (+=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit

    (-=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit

    (.=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a b -> b -> m Unit

    (//=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit

    (<>=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit

    (?=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a (Maybe b) -> b -> m Unit

    (||=) :: forall s a m. (Monad m, MonadState s m, BoolLike a) => ASetterP s a -> a -> m Unit

    assign :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a b -> b -> m Unit


## Module Optic.Types.Extended

### Types

    type AReview s t a b = Optic Tagged Identity s t a b

    type AReviewP t b = AReview t t b b

    type AnIso s t a b = Exchange a b a (Identity b) -> Exchange a b s (Identity t)

    type AnIsoP s a = AnIso s s a a

    type Equality s t a b = forall f p. p a (f b) -> p s (f t)

    type EqualityP s a = Equality s s a a

    type Iso s t a b = forall p f. (Functor f, Profunctor p) => p a (f b) -> p s (f t)

    type IsoP s a = Iso s s a a

    type LensLike f s t a b = (a -> f b) -> s -> f t

    type LensLikeP f s a = LensLike f s s a a

    type Optic p f s t a b = p a (f b) -> p s (f t)

    type OpticP p f s a = Optic p f s s a a

    type Over p f s t a b = p a (f b) -> s -> f t

    type OverP p f s a = Over p f s s a a

    type Review s t a b = forall p f. (Bifunctor p, Profunctor p, Settable f) => Optic p f s t a b

    type ReviewP t b = Review t t b b

    type Traversal s t a b = forall f. (Applicative f) => (a -> f b) -> s -> f t

    type TraversalP s a = Traversal s s a a



