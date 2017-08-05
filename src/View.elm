module View exposing (view)

import Html exposing (Html, text, div, span, form)
import Html.Attributes exposing (href, src, style)
import Model exposing (Model)
import Msg exposing (Msg(..))
import Material.Layout as Layout
import Material.Snackbar as Snackbar
import Material.Icon as Icon
import Material.Color as Color
import Material.Menu as Menu
import Material.Dialog as Dialog
import Material.Button as Button
import Material.Options as Options exposing (css, cs, when)
import Route exposing (Route(..))
import View.Home
import Material.Scheme


view : Model -> Html Msg
view model =
    Material.Scheme.top <|
        Layout.render Mdl
                model.mdl
                [ Layout.fixedHeader
                -- , Layout.transparentHeader
                , Options.css "display" "flex !important"
                , Options.css "flex-direction" "row"
                , Options.css "align-items" "center"
                ]
                { header = [ viewHeader model, viewSubTitle model ]
                , drawer = []
                , tabs = ( [], [] )
                , main =
                    [ viewBody model
                    , Snackbar.view model.snackbar |> Html.map Snackbar
                    ]
                }


-- eg. outline "#000"
--     outline "#333"
outline : String -> ( String, String )
-- outline = ( "text-shadow", "2px 0 0 #000, 0 -2px 0 #000, 0 2px 0 #000, -2px 0 0 #000" )
outline color = ( "text-shadow", "2px 0 0 " ++ color ++ ", 0 -2px 0 " ++ color ++ ", 0 2px 0 " ++ color ++ ", -2px 0 0 " ++ color )

spacing spc = ( "letter-spacing", spc )


viewHeader : Model -> Html Msg
viewHeader model =
    Layout.row
        [ Color.background <| Color.white
        , Color.text <| Color.color Color.Green Color.S300
        , Options.css "align-items" "center"
        ]
        [ Layout.title []                                                                               
            [ Html.h1
                [ style [ outline "#000", spacing "2px" ] ]
                [ text "Here4" ]
            ]
        , Layout.spacer
        , Layout.navigation []
            [ Layout.link
                [ Layout.href "https://github.com/here4"
                , Color.text <| Color.color Color.Green Color.S700
                 ]
                [ text "Github" ]
            ]
        ]

viewSubTitle : Model -> Html Msg
viewSubTitle model =
    Layout.row
        [ Color.background <| Color.white
        , Color.text <| Color.color Color.Green Color.S400
        , Options.css "align-items" "center"
        ]
        [ Layout.title []
            [ Html.h4
                [ style [ outline "#555", spacing "2px" ] ]
                -- [ text "A framework for building 3D apps and the worlds they live in." ]
                -- [ text "Helps you build 3D apps and the worlds they live in." ]
                [ text "Build 3D apps and the worlds they live in." ]
            ]
        ]


viewBody : Model -> Html Msg
viewBody model =
    case model.history |> List.head |> Maybe.withDefault Nothing of
        Just Route.Home ->
            View.Home.view model

        Nothing ->
            text "404"

