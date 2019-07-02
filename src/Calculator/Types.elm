{-
   Módulo en el que se definen los tipos personalizados
   utilizados en todo el programa
-}


module Calculator.Types exposing (Model, Msg(..), Operator(..))

{-
   Modelo de la página.
        -Display: String mostrado en la pantalla de la calculadora
        -firsTerm: Primer operando guardado al pulsar un botón de operación (+,-,/,*)
        -appendNumber: Permite concatenar números reales o números enteros con varias cifras
        -operation: Almacena el operando seleccionado al pulsar un botón de operación
-}


type alias Model =
    { display : String
    , firstTerm : Float
    , appendNumber : Bool
    , operation : Operator
    }



{-
   Define los operandos disponibles en la calculadora
-}


type Operator
    = Add
    | Substract
    | Multiply
    | Divide
    | NoOperation



{-
   Define los mensajes utilizados en la interacción con el usuario
-}


type Msg
    = Clear
    | Value Int
    | Operator Operator
    | Dot
    | Enter
