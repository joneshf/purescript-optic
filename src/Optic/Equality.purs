module Optic.Equality
  ( simple
  , simply
  ) where

  import Optic.Types (EqualityP(), OpticP())

  simple :: forall a. EqualityP a a
  simple = id

  simply :: forall p f s a r. (OpticP p f s a -> r) -> OpticP p f s a -> r
  simply = id
