{-
    Módulo que contiene el estado inicial de la aplicación y la 
    función que actualiza el estado
-}
module Calculator.State exposing (initialModel, update)

import Calculator.Types exposing (Model, Msg(..), Operator(..))
import Calculator.Utils exposing (..)



{-
   Estado inicial de la aplicación
-}


initialModel : Model
initialModel =
    { display = "0"
    , firstTerm = 0
    , appendNumber = False
    , operation = NoOperation
    }



{-
   Función que actualiza el estado de 
   la aplicación
-}


update : Msg -> Model -> Model
update msg model =
    case msg of
        Clear ->
            initialModel

        Value num ->
            onNumberSelected model num

        Dot ->
            onDotSelected model

        Operator operation ->
            onOperatorSelected model operation

        Enter ->
            enter model
