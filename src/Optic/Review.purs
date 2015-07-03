module Optic.Review
  ( (##)
  , re
  , reuse
  , reuses
  , relook
  , relooks
  , unto
  , un
  ) where

  import Prelude

  import Control.Monad.Reader.Class (reader, MonadReader)
  import Control.Monad.State.Class (gets, MonadState)

  import Data.Identity (runIdentity, Identity(..))
  import Data.Profunctor (dimap, lmap, rmap, Profunctor)
  import Data.Tagged (unTagged, Tagged(..))

  import Optic.Getter (to)
  import Optic.Internal.Setter (Settable)
  import Optic.Monad.Getter (look)
  import Optic.Types (Getter(), Getting())
  import Optic.Types.Extended (AReview(), Optic(), OpticP())

  import qualified Data.Bifunctor as B

  infixr 8 ##

  (##) :: forall s t a b. AReview s t a b -> b -> t
  (##) = dimap (Identity >>> Tagged) (unTagged >>> runIdentity)

  re :: forall s t a b. AReview s t a b -> Getter b t
  re stab = to (dimap (Identity >>> Tagged) (unTagged >>> runIdentity) stab)

  reuse :: forall m b a t s. (Monad m, MonadState b m) => AReview s t a b -> m t
  reuse stab = reuses stab id

  reuses :: forall m b r a t s. (Monad m, MonadState b m) => AReview s t a b -> (t -> r) -> m r
  reuses stab t2r =
    gets (dimap (Identity >>> Tagged) (unTagged >>> runIdentity) stab >>> t2r)

  relook :: forall m b a t s. (Monad m, MonadReader b m) => AReview s t a b -> m t
  relook stab = relooks stab id

  relooks :: forall m b r a t s. (Monad m, MonadReader b m) => AReview s t a b -> (t -> r) -> m r
  relooks stab t2r =
    reader (dimap (Identity >>> Tagged) (unTagged >>> runIdentity) stab >>> t2r)

  unto :: forall p f s t a b. (Profunctor p, B.Bifunctor p, Functor f) => (b -> t) -> Optic p f s t a b
  unto b2t = B.lmap absurd <<< lmap absurd <<< rmap ((<$>) b2t)

  un :: forall p f s a. (Profunctor p, B.Bifunctor p, Functor f) => Getting a s a -> OpticP p f a s
  un = look >>> unto

  newtype Void = Void Void

  absurd :: forall a. Void -> a
  absurd a = spin a
    where spin (Void b) = spin b
