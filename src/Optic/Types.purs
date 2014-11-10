module Optic.Types.Extended where

  import Data.Const (Const())
  import Data.Contravariant (Contravariant)
  import Data.Identity (Identity())
  import Data.Profunctor (Profunctor)

  import Optic.Internal.Iso (Exchange())

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

  type Traversal s t a b = forall f. (Applicative f) => (a -> f b) -> s -> f t
  type TraversalP s a = Traversal s s a a
