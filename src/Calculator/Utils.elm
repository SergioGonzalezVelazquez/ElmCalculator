{-

-}
module Calculator.Utils exposing (calculateOperation, enter, onDotSelected, onNumberSelected, onOperatorSelected, operationToString)

import Calculator.Types exposing (Model, Msg(..), Operator(..))

{-
    Pulsación de un número en la calculadora
-}
onNumberSelected : Model -> Int -> Model
onNumberSelected model num =
    if model.appendNumber then
        { model | display = model.display ++ toString num }

    else
        { model | display = toString num, appendNumber = True }

{-
    Pulsación del botón (.) para decimales
-}
onDotSelected : Model -> Model
onDotSelected model =
    case String.toFloat model.display of
        Err msg ->
            { model | display = "0.", appendNumber = True }

        Ok val ->
            { model | display = model.display ++ ".", appendNumber = True }

{-
    Pulsación de un operador en la calculadora
-}
onOperatorSelected : Model -> Operator -> Model
onOperatorSelected model operation =
    case String.toFloat model.display of
        Err msg ->
            { model | display = "Err", firstTerm = 0, operation = NoOperation, appendNumber = False }

        Ok val ->
            { model | display = operationToString operation, firstTerm = val, operation = operation, appendNumber = False }

{-
    Evento del botón ENTER. Utiliza el firstTerm almacenado para aplicar operation seleccionado
    al valor que muestre el display de la calculadora (segundo operando)
-}
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

{-
    Retorna el resultado de aplicar un Operator a dos operandos
-}
calculateOperation : Float -> Float -> Operator -> Float
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



{- 
    Retona el símbolo correspondiente a un Operator
-}


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
