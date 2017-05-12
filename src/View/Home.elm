module View.Home exposing (view)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Material.Color as Color
import Material.Grid as Grid exposing (grid, size, cell, Device(..))
import Material.Elevation as Elevation
import Material.Options as Options exposing (css)
import Material.Table as Table
import Material.Typography as Typography

import Gamepad exposing (..)

view : Model -> Html Msg
view model =
    div [
            style [ ("background-color", "rgba(33, 33, 33, 1.0)") ]
        ] <|
        case model.gamepads of
            [] -> [ noGamepadsCell ]
            _  -> List.map rawGamepadCell model.gamepads

textCell : String -> Html msg
textCell str =
    grid []
        [ cell
              [ size All 12 , Elevation.e2
              , Options.css "align-items" "center"
              , Options.cs "mdl-grid"
              ]
              [
                  text str
              ]
        ]

noGamepadsCell : Html msg
noGamepadsCell =
        Table.table []
            [ Table.thead []
            [ Table.tr []
                [ Table.th
                    [ Options.attribute <| Html.Attributes.colspan 2 ]
                    [ Html.text "No gamepads detected. Press a button to activate." ]
                ]
            ]
            , Table.tbody []
                [ blankRow "buttonBack"
                , blankRow "buttonStart"
                , blankRow "buttonLogo"

                , blankRow "buttonA"
                , blankRow "buttonB"
                , blankRow "buttonX"
                , blankRow "buttonY"

                , blankRow "leftTrigger"
                , blankRow "leftBumper "
                , blankRow  "leftStick"
                , blankRow "leftStick.button"

                , blankRow "rightTrigger"
                , blankRow "rightBumper"
                , blankRow  "rightStick"
                , blankRow "rightStick.button"

                , blankRow "dPadUp"
                , blankRow "dPadDown"
                , blankRow "dPadLeft"
                , blankRow "dPadRight"
                ]
            ]

rawGamepadCell : Gamepad -> Html msg
rawGamepadCell gamepad = case gamepad of
    StandardGamepad standardGamepad ->
        Table.table []
            [ Table.thead []
            [ Table.tr []
                [ Table.th
                    [ Options.attribute <| Html.Attributes.colspan 2 ]
                    [ Html.text standardGamepad.id]
                ]
            ]
            , Table.tbody []
                [ buttonRow "buttonBack" standardGamepad.buttonBack
                , buttonRow "buttonStart" standardGamepad.buttonStart
                , buttonRow "buttonLogo" standardGamepad.buttonLogo

                , buttonRow "buttonA" standardGamepad.buttonA
                , buttonRow "buttonB" standardGamepad.buttonB
                , buttonRow "buttonX" standardGamepad.buttonX
                , buttonRow "buttonY" standardGamepad.buttonY

                , buttonRow "leftTrigger"       standardGamepad.leftTrigger
                , buttonRow "leftBumper "       standardGamepad.leftBumper
                , stickRow  "leftStick"         standardGamepad.leftStick
                , buttonRow "leftStick.button"  standardGamepad.leftStick.button

                , buttonRow "rightTrigger"       standardGamepad.rightTrigger
                , buttonRow "rightBumper"        standardGamepad.rightBumper
                , stickRow  "rightStick"         standardGamepad.rightStick
                , buttonRow "rightStick.button"  standardGamepad.rightStick.button

                , buttonRow "dPadUp"    standardGamepad.dPadUp
                , buttonRow "dPadDown"  standardGamepad.dPadDown
                , buttonRow "dPadLeft"  standardGamepad.dPadLeft
                , buttonRow "dPadRight" standardGamepad.dPadRight
                ]
            ]

    RawGamepad rg ->
        textCell (toString gamepad)

fieldRow : String -> Html msg -> Html msg
fieldRow name td =
    Table.tr []
            [ Table.td [] [ Html.text name ]
            , td
            ]

blankRow : String -> Html msg
blankRow name =
    let
        td = Table.td
                 []
                 []
    in
        fieldRow name td

buttonRow : String -> Button -> Html msg
buttonRow name button =
    let
        td = Table.td
                 (properties button.value)
                 [ Html.text (toString button.value) ]
    in
        fieldRow name td

stickRow : String -> Stick -> Html msg
stickRow name { x, y } =
    let
        magnitude = sqrt (x*x + y*y)

        td = Table.td
                 (properties magnitude)
                 [ Html.text ("(x: " ++ toString x ++ ", y: " ++ toString y ++ ")") ]
    in
        fieldRow name td

properties : Float -> List (Options.Property c m)
properties value =
    let
        typography = [ Typography.title ]

        shade = valueToShade value
        bg =
            if value > 0.01 then
                [ Color.background <| Color.color Color.Yellow shade ]
            else
                []
        fg =
            if value < 0.11 then
                [ Color.text <| Color.color Color.Grey Color.S400 ]
            else
                []
    in
        typography ++ bg ++ fg

valueToShade : Float -> Color.Shade
valueToShade value =
    if abs value < 0.1 then
        Color.S50
    else if value < 0.2 then
        Color.S100
    else if value < 0.3 then
        Color.S200
    else if value < 0.4 then
        Color.S300
    else if value < 0.5 then
        Color.S400
    else if value < 0.6 then
        Color.S500
    else if value < 0.7 then
        Color.S600
    else if value < 0.8 then
        Color.S700
    else if value < 0.9 then
        Color.S800
    else
        Color.S900
