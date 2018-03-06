module Main where

import           Lib

main :: IO ()
main = do
  line <- getLine
  result <- strFxn line
  print result
