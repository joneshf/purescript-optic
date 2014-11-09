module Optic.Traversal
  ( both
  , forOf
  , sequenceOf
  , traverseOf
  ) where

  import Optic.Types (LensLike(), Over(), Traversal())

  import Data.Traversable (traverse, Traversable)
  import Data.Bitraversable (bitraverse, Bitraversable)

  both :: forall b a r. (Bitraversable r) => Traversal (r a a) (r b b) a b
  both f = bitraverse f f

  forOf :: forall p f s t a b. Over p f s t a b -> s -> p a (f b) -> f t
  forOf = flip

  sequenceOf :: forall p f s t a b. LensLike f s t (f b) b -> s -> f t
  sequenceOf l = l id

  traverseOf :: forall p f s t a b. Over p f s t a b -> p a (f b) -> s -> f t
  traverseOf = id
