{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_life (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/lotus/haskell/hutton/83_chapt10/life/.stack-work/install/x86_64-osx/lts-12.5/8.4.3/bin"
libdir     = "/Users/lotus/haskell/hutton/83_chapt10/life/.stack-work/install/x86_64-osx/lts-12.5/8.4.3/lib/x86_64-osx-ghc-8.4.3/life-0.1.0.0-6PSksm44096FPDHQ42ejd4-life"
dynlibdir  = "/Users/lotus/haskell/hutton/83_chapt10/life/.stack-work/install/x86_64-osx/lts-12.5/8.4.3/lib/x86_64-osx-ghc-8.4.3"
datadir    = "/Users/lotus/haskell/hutton/83_chapt10/life/.stack-work/install/x86_64-osx/lts-12.5/8.4.3/share/x86_64-osx-ghc-8.4.3/life-0.1.0.0"
libexecdir = "/Users/lotus/haskell/hutton/83_chapt10/life/.stack-work/install/x86_64-osx/lts-12.5/8.4.3/libexec/x86_64-osx-ghc-8.4.3/life-0.1.0.0"
sysconfdir = "/Users/lotus/haskell/hutton/83_chapt10/life/.stack-work/install/x86_64-osx/lts-12.5/8.4.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "life_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "life_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "life_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "life_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "life_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "life_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
