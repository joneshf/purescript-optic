module Optic.Monad.Getter where

  import Prelude

  import Control.Monad.Reader.Class (reader, MonadReader)
  import Control.Monad.State.Class (gets, MonadState)

  import Data.Const (getConst, Const(..))
  import Data.Profunctor (rmap)

  import Optic.Types (Getting())

  use :: forall s a m. (Monad m, MonadState s m) => Getting a s a -> m a
  use asa = gets (getConst `rmap` asa Const)

  look :: forall r a m. (Monad m, MonadReader r m) => Getting a r a -> m a
  look ara = reader (getConst `rmap` ara Const)
