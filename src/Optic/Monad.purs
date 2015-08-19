module Optic.Monad where

  import Prelude

  import Control.Monad.State (execState, State())

  infixl 1 #~

  (#~) :: forall a s. s -> State s a -> s
  (#~) s sa = execState sa s
