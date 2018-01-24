
{-# LANGUAGE GADTs                #-} --  soft dependent types

{-# LANGUAGE PolyKinds            #-} -- Allow general specification of Refl
{-# LANGUAGE RankNTypes           #-} -- The forall stuff
{-# LANGUAGE DataKinds            #-}
{-# LANGUAGE TypeFamilies         #-}

module Proof where

-- Our type level numerals
data Nat = Z | S Nat

-- Value level naturals
data SNat (n :: Nat) where
  Zero :: SNat Z
  Succ :: SNat n -> SNat (S n)

instance Show (SNat n) where
   show Zero     = "Zero"
   show (Succ n) = "Succ " ++ (show n)

type family Add (n :: Nat) (m :: Nat) :: Nat
type instance Add Z      m = m
type instance Add (S m)  n = S (Add m n)

-- Type Equality

-- Import from Data.Type.Equality. Only explicit for educational purposes.

data Refl a b where
  Refl :: Refl a a

instance Show (Refl a b) where
   show Refl     = "Refl"

-- Basic properties
reflexive :: Refl a a
reflexive = Refl

symmetry :: Refl a b -> Refl b a
symmetry Refl = Refl

transitive :: Refl a b -> Refl b c -> Refl a c
transitive Refl Refl = Refl

-- helpers
castWith :: Refl a b -> a -> b
castWith Refl x = x

gcastWith :: Refl a b -> ((a ~ b) => r) -> r
gcastWith Refl x = x

-- Proof, no quantifiers

-- 1+1=2
onePlusOneEqualsTwo :: Refl (Add (S Z) (S Z)) (S (S Z))
onePlusOneEqualsTwo = Refl

-- Intermedio: Proof using quantifiers but no induction

-- Weird names for not hitting prelude names
data Boolean = Tru | Fls

data SBool (a :: Boolean) where
    STrue  :: SBool Tru
    SFalse :: SBool Fls

type family And (a :: Boolean) (b :: Boolean) :: Boolean
type instance And Tru Tru   = Tru
type instance And Fls Tru   = Fls
type instance And Tru Fls   = Fls
type instance And Fls Fls   = Fls

type family Or (a :: Boolean) (b :: Boolean) :: Boolean
type instance Or Tru Tru   = Tru
type instance Or Fls Tru   = Tru
type instance Or Tru Fls   = Tru
type instance Or Fls Fls   = Fls

type family Not (b :: Boolean) :: Boolean
type instance Not Tru   = Fls
type instance Not Fls   = Tru

-- Proof using quantifiers, but no induction
deMorgan :: SBool a -> SBool b -> Refl (Not (And a b)) (Or (Not a) (Not b))
deMorgan STrue STrue   = Refl
deMorgan STrue SFalse  = Refl
deMorgan SFalse STrue  = Refl
deMorgan SFalse SFalse = Refl


-- Proof - a single quantifier and induction

plus_id_l :: SNat n -> Refl (Add Z n) n
plus_id_l n = Refl -- Follows directly from the specification of add

plus_id_r :: forall n. SNat n -> Refl (Add n Z)  n
plus_id_r Zero = Refl
plus_id_r (Succ x) = gcastWith (plus_id_r x) Refl -- Hey! Induction!

-- Proof - two quantifiers

plus_is_associative :: SNat a -> SNat b -> SNat c -> Refl (Add a (Add b c)) (Add (Add a b) c)
plus_is_associative Zero b c = Refl
plus_is_associative (Succ a) b c    = gcastWith (plus_is_associative a b c) Refl

plus_is_commutative :: SNat n -> SNat m -> Refl (Add m n) (Add n m)
plus_is_commutative Zero Zero  = Refl
plus_is_commutative Zero m     = plus_id_r m
plus_is_commutative (Succ n) m = error "For the reader"
