module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (class, id, type_)



--Model


type alias Model =
    { name : String
    , email : String
    , password : String
    , loggedIn : Bool
    }


initialModel : Model
initialModel =
    { name = ""
    , email = ""
    , password = ""
    , loggedIn = False
    }



-- View


view : Model -> Html msg
view model =
    div [] [ mainContent ]


mainContent =
    div [ class "calc-container" ]
        [ calculatorDisplay
        , calculatorButtons
        ]


calculatorDisplay =
    div [ class "calc-display-frame" ]
        [ div [ class "calc-display-text" ] [ text "5" ] ]


calculatorButtons =
    div []
        [ div [ class "calc-button-row" ] [ numButton 7, numButton 8, numButton 9, button [ class "clear-button" ] [ text "C" ] ]
        , div [ class "calc-button-row" ] [ numButton 4, numButton 5, numButton 6, button [ class "operation-button" ] [ text "/" ] ]
        , div [ class "calc-button-row" ] [ numButton 1, numButton 2, numButton 3, button [ class "operation-button" ] [ text "X" ] ]
        , div [ class "calc-button-row" ] [ numButton 0, button [ class "number-button" ] [ text "." ], button [ class "operation-button" ] [ text "+" ], button [ class "operation-button" ] [ text "-" ] ]
        , div [ class "calc-button-row" ] [ button [ class "enter-button" ] [ text "ENTER" ] ]
        ]


numButton n =
    button [ class "number-button" ] [ text (toString n) ]



-- Update


update : msg -> Model -> Model
update msg model =
    initialModel


main : Program Never Model msg
main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }