{-
   Archivo principal del proyecto
-}


module Main exposing (main)

import Calculator.State exposing (initialModel, update)
import Calculator.Types exposing (Model, Msg)
import Calculator.View exposing (view)
import Html exposing (beginnerProgram)



-- Punto de entrada del programa


main : Program Never Model Msg
main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
