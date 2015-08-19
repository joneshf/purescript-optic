module Optic.Equality
  ( simple
  , simply
  ) where

  import Prelude

  import Optic.Types.Extended (EqualityP(), OpticP())

  simple :: forall a. EqualityP a a
  simple = id

  simply :: forall p f s a r. (OpticP p f s a -> r) -> OpticP p f s a -> r
  simply = id
