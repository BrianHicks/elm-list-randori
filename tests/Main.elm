port module Main exposing (..)

import Json.Encode exposing (Value)
import LListTests
import Test.Runner.Node exposing (run)


main : Program Value
main =
    run emit LListTests.all


port emit : ( String, Value ) -> Cmd msg
