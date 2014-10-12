{-# LANGUAGE OverloadedStrings #-}

module Main where
import Data.ByteString.Lazy.Char8
import Data.ByteString.Char8
import Data.String
import Control.Monad    (msum)
import Happstack.Server
import           Text.Blaze ((!))
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import MakeElements
import MasterTemplate
import GridResponse
import GraphResponse

graph :: String
graph = "planner.html"

grid :: String
grid = "timetable_creator.html"

static :: String
static = "static"

staticDir :: String
staticDir = "/home/cynic/courseography"

main :: IO ()
main = simpleHTTP nullConf $
  msum [ dir grid $ graphResponse,
         dir graph $ gridResponse,
         dir static $ serveDirectory EnableBrowsing [] staticDir
       ]