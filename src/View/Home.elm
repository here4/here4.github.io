module View.Home exposing (view)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Html exposing (Html, div, text)
import Html.Attributes exposing (href, src, style)
import Material.Card as Card
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
        [ textCell "Create 3D apps"
            """
Apps handle their own user interaction and manage their own state.
Apps can also interact with their virtual environment, external APIs and other apps.
"""

        , textCell "Put apps in worlds"
            """
Create your own personal space.
Import and customize apps that other people have published.
"""

{-
        , textCell "Add objects"
            """
Place photo frames, build video walls
"""
-}

        , textCell "Add portals"
            """
Link your world to other worlds.
Target specific places and objects in the other world.
Join the world wide web of worlds
"""

        , textCell "Add vehicles and tools"
            """
Move around your world and do useful work
"""

{-
        , textCell "Customize your avatar"
            """
"""
-}

        , textCell "Make a scene"
            """
Use your favourite camera shots, including tracking, dolly zoom, arc
and point-of-view.
Add lighting and atmosphere.
"""

        , textCell "Host your world"
            """
Anywhere that supports static file serving, like Github Pages or Dropbox.
"""

{-
        , textCell "Make games"
            """
Duh.
"""
-}
        ]

textCell : String -> String -> Grid.Cell Msg
textCell title content =
    cell
        [ size All 4
        , Elevation.e2
        , Options.css "align-items" "center"
        , Options.cs "mdl-grid"
        , Color.text <| Color.color Color.Grey Color.S900
        ]
        [ textCard title content
        ]

textCard : String -> String -> Html Msg
textCard title content =
    Card.view
        [ css "width" "100%"
        ]
        [ Card.title
            []
            [ Card.head
                [ Color.text <| Color.color Color.Green Color.S400
                , css "width" "100%"
                ]
                [ text title ]
            ]
        , Card.text []
            [ text content ]
        ]
