module Main where

import           Lib

main :: IO ()
main = do
  result <- strFxn "TESTSTRING"
  putStrLn result
