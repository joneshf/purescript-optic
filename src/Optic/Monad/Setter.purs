module Optic.Monad.Setter where

  import Prelude

  import Control.Monad.State.Class (modify, MonadState)

  import Data.Maybe (Maybe(..))
  import Data.Profunctor (Profunctor)

  import Optic.Setter
    ( (%~)
    , (.~)
    , (+~)
    , (-~)
    , (*~)
    , (//~)
    , (||~)
    , (&&~)
    , (<>~)
    , (++~)
    , (?~)
    , set
    )
  import Optic.Types (ASetter(), ASetterP(), Setting())

  assign :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a b -> b -> m Unit
  assign ssab b = modify $ set ssab b

  -- Line noise with State!

  infixr 4 %=
  infixr 4 .=
  infixr 4 +=
  infixr 4 -=
  infixr 4 *=
  infixr 4 //=
  infixr 4 ||=
  infixr 4 &&=
  infixr 4 <>=
  infixr 4 ++=
  infixr 4 ?=
      
  (%=) :: forall p b a m s. (Monad m, MonadState s m, Profunctor p) => Setting p s s a b -> p a b -> m Unit
  (%=) ssab b = modify $ ssab %~ b

  (.=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a b -> b -> m Unit
  (.=) ssab b = modify $ ssab .~ b

  (+=) :: forall s a m. (Monad m, MonadState s m, Semiring a) => ASetterP s a -> a -> m Unit
  (+=) ssab b = modify $ ssab +~ b

  (-=) :: forall s a m. (Monad m, MonadState s m, Ring a) => ASetterP s a -> a -> m Unit
  (-=) ssab b = modify $ ssab -~ b

  (*=) :: forall s a m. (Monad m, MonadState s m, Semiring a) => ASetterP s a -> a -> m Unit
  (*=) ssab b = modify $ ssab *~ b

  (//=) :: forall s a m. (Monad m, MonadState s m, DivisionRing a) => ASetterP s a -> a -> m Unit
  (//=) ssab b = modify $ ssab //~ b

  (||=) :: forall s a m. (Monad m, MonadState s m, BooleanAlgebra a) => ASetterP s a -> a -> m Unit
  (||=) ssab b = modify $ ssab ||~ b

  (&&=) :: forall s a m. (Monad m, MonadState s m, BooleanAlgebra a) => ASetterP s a -> a -> m Unit
  (&&=) ssab b = modify $ ssab &&~ b

  (<>=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit
  (<>=) ssab b = modify $ ssab <>~ b

  (++=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit
  (++=) ssab b = modify $ ssab ++~ b

  (?=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a (Maybe b) -> b -> m Unit
  (?=) ssab b = modify $ ssab ?~ b
