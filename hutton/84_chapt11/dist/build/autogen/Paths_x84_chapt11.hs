{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
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

bindir     = "/home/john/.cabal/bin"
libdir     = "/home/john/.cabal/lib/x86_64-linux-ghc-8.0.1/x84-chapt11-0.1.0.0-7GQWsYgmt116enSfVFlSJ8"
dynlibdir  = "/home/john/.cabal/lib/x86_64-linux-ghc-8.0.1"
datadir    = "/home/john/.cabal/share/x86_64-linux-ghc-8.0.1/x84-chapt11-0.1.0.0"
libexecdir = "/home/john/.cabal/libexec"
sysconfdir = "/home/john/.cabal/etc"

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
