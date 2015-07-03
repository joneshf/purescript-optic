## Module Optic.Monad.Getter

#### `use`

``` purescript
use :: forall s a m. (Monad m, MonadState s m) => Getting a s a -> m a
```

#### `look`

``` purescript
look :: forall r a m. (Monad m, MonadReader r m) => Getting a r a -> m a
```


