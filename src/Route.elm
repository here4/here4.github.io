module Route exposing (..)

import Navigation
import UrlParser exposing (parsePath, oneOf, map, top, s, (</>), string)

type Route
    = Home


type alias Model =
    Maybe Route


pathParser : UrlParser.Parser (Route -> a) a
pathParser =
    oneOf
        [ map Home    (s "")
        ]


init : Maybe Route -> List (Maybe Route)
init location =
    case location of
        Nothing ->
            [ Just Home ]

        something ->
            [ something ]


urlFor : Route -> String
urlFor loc =
    case loc of
        Home ->
            "/"


locFor : Navigation.Location -> Maybe Route
locFor path =
    parsePath pathParser path
