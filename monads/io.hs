import Data.Char
import Control.Monad

main :: IO ()
main = print =<< liftM2 (+) readLn readLn
