module HideShow exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }

-- MODEL

type alias Model = { height : Int, width: Int, buttonText : String }
type alias ButtonType = {height : Int, width: Int}

model : Model
model = { height = 200, width = 200, buttonText = "-" }

button1 : ButtonType
button1 = { height = 20, width = 20 }

-- UPDATE

type Msg = Toggle

update : Msg -> Model -> Model
update msg model =
    case msg of
        Toggle ->
          if model.buttonText == "-" then
            {model | width = button1.width+10, height = button1.height+10, buttonText = "+" }

          else
            {model | width = 200, height = 200, buttonText = "-"}

-- VIEW

view : Model -> Html Msg
view model =
    div [
      style
        [ ("background-color", "red")
        , ("height", toString model.height ++ "px")
        , ("width", toString model.width ++ "px")
        , ("margin", "5px") ]
        ]
      [ button
        [ style
          [ ("height", toString button1.height ++ "px")
          , ("width", toString button1.width ++ "px")
          , ("margin", "4px")
          ]
        , onClick Toggle
        ] [ text model.buttonText]
    ]
