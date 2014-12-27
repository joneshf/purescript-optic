module Optic.Extended where

  import qualified Optic.Equality as OE
  import qualified Optic.Fold as OF
  import qualified Optic.Iso as OI
  import qualified Optic.Monad as OM
  import qualified Optic.Monad.Getter as OMG
  import qualified Optic.Monad.Setter as OMS
  import qualified Optic.Review as OR
  import qualified Optic.Traversal as OT
  import qualified Optic.Types.Extended as OTE

  -- Equality

  simple = OE.simple
  simply = OE.simply

  -- Fold

  infixl 8 ^..
  infixl 8 ^?

  (^..)     = OF.(^..)
  (^?)      = OF.(^?)
  filtered  = OF.filtered
  foldlOf   = OF.foldlOf
  foldMapOf = OF.foldMapOf
  foldOf    = OF.foldOf
  foldrOf   = OF.foldrOf
  has       = OF.has
  hasn't    = OF.hasn't
  toListOf  = OF.toListOf

  -- Iso

  au       = OI.au
  auf      = OI.auf
  cloneIso = OI.cloneIso
  enum     = OI.enum
  from     = OI.from
  iso      = OI.iso
  mapping  = OI.mapping
  under    = OI.under
  withIso  = OI.withIso

  -- Monad

  infixl 1 #~

  (#~) = OM.(#~)

  -- Monad.Getter

  use  = OMG.use
  look = OMG.look

  -- Monad.Setter

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

  (%=)   = OMS.(%=)
  (.=)   = OMS.(.=)
  (+=)   = OMS.(+=)
  (-=)   = OMS.(-=)
  (*=)   = OMS.(*=)
  (//=)  = OMS.(//=)
  (||=)  = OMS.(||=)
  (&&=)  = OMS.(&&=)
  (<>=)  = OMS.(<>=)
  (++=)  = OMS.(++=)
  (?=)   = OMS.(?=)
  assign = OMS.assign

  -- Review

  infixr 8 ##

  (##)    = OR.(##)
  re      = OR.re
  reuse   = OR.reuse
  reuses  = OR.reuses
  relook  = OR.relook
  relooks = OR.relooks
  unto    = OR.unto
  un      = OR.un

  -- Traversal

  both       = OT.both
  forOf      = OT.forOf
  sequenceOf = OT.sequenceOf
  traverseOf = OT.traverseOf

  -- Types.Extended

  type AnIso s t a b      = OTE.AnIso s t a b
  type AnIsoP s a         = OTE.AnIsoP s a
  type AReview s t a b    = OTE.AReview s t a b
  type AReviewP t b       = OTE.AReviewP t b
  type Equality s t a b   = OTE.Equality s t a b
  type EqualityP s a      = OTE.EqualityP s a
  type Iso s t a b        = OTE.Iso s t a b
  type IsoP s a           = OTE.IsoP s a
  type LensLike f s t a b = OTE.LensLike f s t a b
  type LensLikeP f s a    = OTE.LensLikeP f s a
  type Optic p f s t a b  = OTE.Optic p f s t a b
  type OpticP p f s a     = OTE.OpticP p f s a
  type Over p f s t a b   = OTE.Over p f s t a b
  type OverP p f s a      = OTE.OverP p f s a
  type Review s t a b     = OTE.Review s t a b
  type ReviewP t b        = OTE.ReviewP t b
  type Traversal s t a b  = OTE.Traversal s t a b
  type TraversalP s a     = OTE.TraversalP s a
