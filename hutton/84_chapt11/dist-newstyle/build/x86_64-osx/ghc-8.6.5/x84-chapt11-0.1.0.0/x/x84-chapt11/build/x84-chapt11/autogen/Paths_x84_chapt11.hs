{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_x84_chapt11 (
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

bindir     = "/Users/lotus/.cabal/bin"
libdir     = "/Users/lotus/.cabal/lib/x86_64-osx-ghc-8.6.5/x84-chapt11-0.1.0.0-inplace-x84-chapt11"
dynlibdir  = "/Users/lotus/.cabal/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/lotus/.cabal/share/x86_64-osx-ghc-8.6.5/x84-chapt11-0.1.0.0"
libexecdir = "/Users/lotus/.cabal/libexec/x86_64-osx-ghc-8.6.5/x84-chapt11-0.1.0.0"
sysconfdir = "/Users/lotus/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "x84_chapt11_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "x84_chapt11_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "x84_chapt11_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "x84_chapt11_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "x84_chapt11_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "x84_chapt11_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
