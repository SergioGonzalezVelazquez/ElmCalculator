module Main exposing (main)

{--Main of the app

-}


import Html exposing (beginnerProgram)
import Calculator.State exposing (initialModel, update)
import Calculator.Types exposing (Model, Msg)
import Calculator.View exposing (view)



-- Entry point


main : Program Never Model Msg
main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
