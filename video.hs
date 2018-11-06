{-# LANGUAGE GADTs #-}

module STy where

data STy ty where
  SInt  :: STy Int
  SBool :: STy Bool

zero :: STy ty -> ty
zero SInt  = 5
zero SBool = False
