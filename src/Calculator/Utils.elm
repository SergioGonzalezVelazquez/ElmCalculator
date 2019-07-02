module Calculator.Utils exposing (..)

import Calculator.Types exposing (Model,  Msg(..), Operator(..))

onNumberSelected : Model -> Int -> Model
onNumberSelected model num =
    if model.appendNumber then
        { model | display = model.display ++ toString num }

    else
        { model | display = toString num, appendNumber = True }


onDotSelected : Model -> Model
onDotSelected model =
    case String.toFloat model.display of
        Err msg ->
            { model | display = "0.", appendNumber = True }

        Ok val ->
            { model | display = model.display ++ ".", appendNumber = True }


onOperatorSelected : Model -> Operator -> Model
onOperatorSelected model operation =
    case String.toFloat model.display of
        Err msg ->
            { model | display = "Err", firstTerm = 0, operation = NoOperation, appendNumber = False }

        Ok val ->
            { model | display = operationToString operation, firstTerm = val, operation = operation, appendNumber = False }


enter : Model -> Model
enter model =
    case String.toFloat model.display of
        Err msg ->
            { model | display = "Err", firstTerm = 0, operation = NoOperation, appendNumber = False }

        Ok val ->
            { model
                | display = toString (calculateOperation model.firstTerm val model.operation)
                , firstTerm = calculateOperation model.firstTerm val model.operation
                , operation = NoOperation
                , appendNumber = False
            }


calculateOperation x y operation =
    case operation of
        NoOperation ->
            x

        Add ->
            x + y

        Substract ->
            x - y

        Multiply ->
            x * y

        Divide ->
            x / y



{- Dado un Operation devuelve un String -}


operationToString : Operator -> String
operationToString operation =
    case operation of
        Add ->
            "+"

        Substract ->
            "-"

        Multiply ->
            "x"

        Divide ->
            "/"

        NoOperation ->
            ""




