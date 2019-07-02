module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (class, id, type_)
import Html.Events exposing (onClick)



--Model


type alias Model =
    { display : String
    , firstTerm : Float
    , appendNumber : Bool
    , operation : Operation
    }


type Operation
    = Add
    | Substract
    | Multiply
    | Divide
    | None


initialModel : Model
initialModel =
    { display = "0"
    , firstTerm = 0
    , appendNumber = False
    , operation = None
    }



-- View


view : Model -> Html Msg
view model =
    div [] [ mainContent model ]


mainContent model =
    div [ class "calc-container" ]
        [ calculatorDisplay model
        , calculatorButtons model
        ]


calculatorDisplay model =
    div [ class "calc-display-frame" ]
        [ div [ class "calc-display-text" ] [ text model.display ] ]


calculatorButtons model =
    div []
        [ div [ class "calc-button-row" ] [ numButton 7, numButton 8, numButton 9, button [ class "clear-button", onClick Clear ] [ text "C" ] ]
        , div [ class "calc-button-row" ] [ numButton 4, numButton 5, numButton 6, operationButton Divide ]
        , div [ class "calc-button-row" ] [ numButton 1, numButton 2, numButton 3, operationButton Multiply ]
        , div [ class "calc-button-row" ] [ numButton 0, button [ class "number-button", onClick Dot ] [ text "." ], operationButton Add, operationButton Substract ]
        , div [ class "calc-button-row" ] [ button [ class "enter-button", onClick Enter ] [ text "ENTER" ] ]
        ]


numButton n =
    button [ class "number-button", onClick (Value n) ] [ text (toString n) ]


operationButton operation =
    button [ class "operation-button", onClick (Operator operation) ] [ text (operationToString operation) ]



-- Update


type Msg
    = Clear
    | Value Int
    | Operator Operation
    | Dot
    | Enter


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


onOperatorSelected : Model -> Operation -> Model
onOperatorSelected model operation =
    case String.toFloat model.display of
        Err msg ->
            { model | display = "Err", firstTerm = 0, operation = None, appendNumber = False }

        Ok val ->
            { model | display = operationToString operation, firstTerm = val, operation = operation, appendNumber = False }


enter : Model -> Model
enter model =
    case String.toFloat model.display of
        Err msg ->
            { model | display = "Err", firstTerm = 0, operation = None, appendNumber = False }

        Ok val ->
            { model
                | display = toString (calculateOperation model.firstTerm val model.operation)
                , firstTerm = calculateOperation model.firstTerm val model.operation
                , operation = None
                , appendNumber = False
            }


calculateOperation x y operation =
    case operation of
        None ->
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


operationToString : Operation -> String
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

        None ->
            ""


main : Program Never Model Msg
main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
