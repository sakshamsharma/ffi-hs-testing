module Main where

import           Foreign.C.String
import           Foreign.Marshal.Alloc

-- | The call which brings the Foreign function into scope, with manually
--   declared type. This type is not checked at compile time.
--   ccall means C-calling-convention, which is usually what you want.
foreign import ccall "StrFxn" go_StrFxn :: CString -> IO CString

-- | Custom function to make CString-based FFI functions user-friendly.
runStrFxn :: (CString -> IO CString) -> String -> IO String
runStrFxn f input = do
  cinput <- newCString input
  coutput <- f cinput
  res <- peekCString coutput
  _ <- free cinput
  _ <- free coutput
  return res

-- | User friendly function for profit :)
strFxn :: String -> IO String
strFxn = runStrFxn go_StrFxn

main :: IO ()
main = do
  line <- getLine
  result <- strFxn line
  print result
