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
           Color.background <| Color.white
        ]
        [
        --  textCell "Create apps"
        -- , textCell "Put them in worlds"
        ]

textCell : String -> Grid.Cell msg
textCell str =
    cell
        [ size All 12
        , Elevation.e2
        , Options.css "align-items" "center"
        , Options.cs "mdl-grid"
        , Color.text <| Color.color Color.Grey Color.S900
        ]
        [
            text str
        ]

