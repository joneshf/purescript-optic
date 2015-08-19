module Optic.Iso
  ( au
  , auf
  , cloneIso
  , enum
  , from
  , iso
  , mapping
  , under
  , withIso
  ) where

  import Prelude

  import Optic.Internal.Iso (Exchange(..))
  import Optic.Types.Extended (AnIso(), Iso(), IsoP())

  import Data.Enum (fromEnum, toEnum, Enum)
  import Data.Identity (runIdentity, Identity(..))
  import Data.Maybe (maybe, Maybe(..))
  import Data.Monoid (mempty, Monoid)
  import Data.Profunctor (dimap, rmap, Profunctor)
  import Data.Tuple (curry, uncurry, Tuple(..))

  -- iso :: forall s t a b. (s -> a) -> (b -> t) -> Iso s t a b
  iso :: forall f p s t a b. (Profunctor p, Functor f) => (s -> a) -> (b -> t) -> p a (f b) -> p s (f t)
  iso s2a b2t = dimap s2a ((<$>) b2t)

  -- from :: forall s t a b. AnIso s t a b -> Iso b a t s
  from :: forall f p s t a b. (Profunctor p, Functor f) => AnIso s t a b -> p t (f s) -> p b (f a)
  from stab = withIso stab \s2a b2t -> iso b2t s2a

  withIso :: forall b r a t s. AnIso s t a b -> ((s -> a) -> (b -> t) -> r) -> r
  withIso stab f = case stab (Exchange id Identity) of
    Exchange s2a b2t -> f s2a (runIdentity <<< b2t)

  cloneIso :: forall f p s t a b. (Profunctor p, Functor f) => AnIso s t a b -> p a (f b) -> p s (f t)
  cloneIso stab = withIso stab iso

  au :: forall b e a t s. AnIso s t a b -> ((b -> t) -> e -> s) -> e -> a
  au stab = withIso stab \s2a b2t f e -> s2a $ f b2t e

  auf :: forall p s t a b e r. (Profunctor p) => AnIso s t a b -> (p r a -> e -> b) -> p r s -> e -> t
  auf stab = withIso stab \s2a b2t f prs e -> b2t $ f (rmap s2a prs) e

  under :: forall s t a b. AnIso s t a b -> (t -> s) -> b -> a
  under stab = withIso stab \s2a b2t t2s -> b2t >>> t2s >>> s2a

  enum :: forall a. (Enum a, Monoid a) => IsoP Int a
  enum = iso (toEnum >>> maybe mempty id) fromEnum

  mapping :: forall f g p s t a b. (Functor f, Functor g, Profunctor p) => AnIso s t a b -> p (f a) (f (g b)) -> p (f s) (f (g t))
  mapping stab = withIso stab \ s2a b2t -> iso ((<$>) s2a) ((<$>) b2t)

  curried :: forall a b c d e f. Iso (Tuple a b -> c) (Tuple d e -> f) (a -> b -> c) (d -> e -> f)
  curried = iso curry uncurry

  uncurried :: forall a b c d e f. Iso (a -> b -> c) (d -> e -> f) (Tuple a b -> c) (Tuple d e -> f)
  uncurried = iso uncurry curry

  flipped :: forall a b c d e f. Iso (a -> b -> c) (d -> e -> f) (b -> a -> c) (e -> d -> f)
  flipped = iso flip flip
