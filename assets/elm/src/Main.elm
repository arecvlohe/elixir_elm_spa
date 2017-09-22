module Main exposing (..)

import Html exposing (Html, text)
import Http exposing (send, get)
import Json.Decode exposing (Decoder, field, string)
import Navigation
import List


type alias Model =
    { history : List Navigation.Location, hello : String }


initialModel : Model
initialModel =
    { history = [], hello = "" }


decode : Decoder String
decode =
    (field "hello" string)


getHello : Cmd Msg
getHello =
    send Hello <| (get "/api/hello" decode)


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( Model [ location ] ""
    , if location.pathname == "/hello" then
        getHello
      else
        Cmd.none
    )


type Msg
    = UrlChange Navigation.Location
    | Hello (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            { model | history = location :: model.history, hello = "" } ! []

        Hello (Ok str) ->
            ( { model | hello = str }, Cmd.none )

        Hello (Err _) ->
            model ! []


view : Model -> Html msg
view model =
    text ("Hello, " ++ model.hello)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
