module Calculator.Types exposing (Model, Msg(..), Operator(..))


type alias Model =
    { display : String
    , firstTerm : Float
    , appendNumber : Bool
    , operation : Operator
    }


type Operator
    = Add
    | Substract
    | Multiply
    | Divide
    | NoOperation


type Msg
    = Clear
    | Value Int
    | Operator Operator
    | Dot
    | Enter
