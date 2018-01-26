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

type alias Model = { displayPanel : Bool }

model : Model
model = { displayPanel = False }

-- UPDATE

type Msg = Expand | Collapse

update : Msg -> Model -> Model
update msg model =
    case msg of
        Collapse ->
          {model | displayPanel = False }
        Expand ->
          {model | displayPanel = True }

-- VIEW

view : Model -> Html Msg
view model =
  if model.displayPanel then
    div []
      [ div
        [ style
          [("border-style", "solid")
          , ("border-color", "black")
          ]
        ]
        [ button [ onClick Collapse ] [ text "-" ]
        , text "Profile Info"
        ],
      div []
        [ input [ type_ "text", placeholder "First Name" ] []
        , input [ type_ "text", placeholder "Last Name" ] []
        , button [] [ text "Submit" ]
      ]
    ]
  else
      div []
        [ div
          [ style
            [("border-style", "solid")
            , ("border-color", "black")
            ]
          ]
          [ button [ onClick Expand ] [ text "+" ]
          , text "Profile Info"
          ]
        ]
