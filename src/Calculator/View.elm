module Calculator.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, id, type_)
import Html.Events exposing (onClick)

import Calculator.Types exposing (Model,  Msg(..), Operator(..))
import Calculator.Utils exposing (..)


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

