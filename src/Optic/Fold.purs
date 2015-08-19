module Optic.Fold
  ( (^..)
  , (^?)
  , filtered
  , foldlOf
  , foldMapOf
  , foldOf
  , foldrOf
  , has
  , hasn't
  , toListOf
  ) where

  import Prelude

  import Data.Const (getConst, Const(..))
  import Data.Either (either, Either(..))
  import Data.Maybe (Maybe(..))
  import Data.Monoid.Conj (runConj, Conj(..))
  import Data.Monoid.Disj (runDisj, Disj(..))
  import Data.Monoid.Dual (runDual, Dual(..))
  import Data.Monoid.Endo (runEndo, Endo(..))
  import Data.Maybe.First (runFirst, First(..))
  import Data.List (List(..), (:))
  import Data.Profunctor (dimap, lmap, rmap, Profunctor)
  import Data.Profunctor.Choice (right, Choice)

  import Optic.Types (Accessing(), Getting())
  import Optic.Types.Extended (OpticP())

  infixl 8 ^..
  infixl 8 ^?

  filtered :: forall f a p. (Applicative f, Choice p) => (a -> Boolean) -> OpticP p f a a
  filtered p = dimap (\x -> if p x then Right x else Left x) (either pure id) <<< right

  foldOf :: forall a s. Getting a s a -> s -> a
  foldOf asa s = getConst $ asa Const s

  foldrOf :: forall r a s p. (Profunctor p) => Accessing p (Endo r) s a -> p a (r -> r) -> r -> s -> r
  foldrOf pErsa par2r r =
    rmap (flip runEndo r) (foldMapOf pErsa (Endo `rmap` par2r))

  foldlOf :: forall r a s. Getting (Dual (Endo r)) s a -> (r -> a -> r) -> r -> s -> r
  foldlOf pErsa par2r r =
    rmap (runDual `lmap` flip runEndo r) (foldMapOf pErsa (Dual `rmap` Endo `rmap` flip par2r))

  foldMapOf :: forall r a s p. (Profunctor p) => Accessing p r s a -> p a r -> s -> r
  foldMapOf prsa par = getConst `rmap` prsa (Const `rmap` par)

  has :: forall b a s. (BooleanAlgebra b) => Getting (Disj b) s a -> s -> b
  has asa s = runDisj $ foldMapOf asa (const $ Disj top) s

  hasn't :: forall b a s. (BooleanAlgebra b) => Getting (Conj b) s a -> s -> b
  hasn't asa s = runConj $ foldMapOf asa (const $ Conj bottom) s

  toListOf :: forall a s. Getting (Endo (List a)) s a -> s -> List a
  toListOf easa = foldrOf easa (:) Nil

  (^..) :: forall a s. s -> Getting (Endo (List a)) s a -> List a
  (^..) = flip toListOf

  (^?) :: forall a s. s -> Getting (First a) s a -> Maybe a
  (^?) s fasa = runFirst $ foldMapOf fasa (First `rmap` Just) s
