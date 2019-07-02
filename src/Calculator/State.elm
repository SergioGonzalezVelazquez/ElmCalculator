module Calculator.State exposing (initialModel, update)

import Calculator.Utils exposing (..)
import Calculator.Types exposing (Model,  Msg(..), Operator(..))


initialModel : Model
initialModel =
    { display = "0"
    , firstTerm = 0
    , appendNumber = False
    , operation = NoOperation
    }

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
