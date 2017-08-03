module View.Home exposing (view)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Html exposing (Html, div, text)
import Material.Color as Color
import Material.Grid as Grid exposing (grid, size, cell, Device(..))
import Material.Elevation as Elevation
import Material.Options as Options exposing (css)

view : Model -> Html Msg
view model =
    grid
        [
           Color.background <| Color.color Color.Grey Color.S900
        ]
        [
            homeCell
        ]

textCell : String -> Grid.Cell msg
textCell str =
    cell
        [ size All 12
        , Elevation.e2
        , Options.css "align-items" "center"
        , Options.cs "mdl-grid"
        -- , Color.text <| Color.color Color.Green Color.S500
        , Color.text <| Color.color Color.Grey Color.S200
        ]
        [
            text str
        ]

homeCell : Grid.Cell msg
homeCell = textCell
    "Here4 is a framework for building 3D apps and the worlds they live in."

