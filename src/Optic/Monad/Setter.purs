module Optic.Monad.Setter where

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

  (%=) :: forall p b a m s. (Monad m, MonadState s m, Profunctor p) => Setting p s s a b -> p a b -> m Unit
  (%=) ssab b = modify $ ssab %~ b

  (.=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a b -> b -> m Unit
  (.=) ssab b = modify $ ssab .~ b

  (+=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit
  (+=) ssab b = modify $ ssab +~ b

  (-=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit
  (-=) ssab b = modify $ ssab -~ b

  (*=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit
  (*=) ssab b = modify $ ssab *~ b

  (//=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit
  (//=) ssab b = modify $ ssab //~ b

  (||=) :: forall s a m. (Monad m, MonadState s m, BoolLike a) => ASetterP s a -> a -> m Unit
  (||=) ssab b = modify $ ssab ||~ b

  (&&=) :: forall s a m. (Monad m, MonadState s m, BoolLike a) => ASetterP s a -> a -> m Unit
  (&&=) ssab b = modify $ ssab &&~ b

  (<>=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit
  (<>=) ssab b = modify $ ssab <>~ b

  (++=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit
  (++=) ssab b = modify $ ssab ++~ b

  (?=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a (Maybe b) -> b -> m Unit
  (?=) ssab b = modify $ ssab ?~ b
