import Html exposing (..)

-- MODEL

type alias Model = {...}


-- UPDATE

type Msg = Reset | ...

update : Msg -> Model -> Model

update msg model =
    case msg of
        Reset -> ...
        ...


-- VIEW

view : model -> Html Msg
view model =
    ...