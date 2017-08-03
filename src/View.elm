module View exposing (view)

import Html exposing (Html, text, div, span, form)
import Html.Attributes exposing (href, src)
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


styles : String
styles =
    """
   .demo-options .mdl-checkbox__box-outline {
      border-color: rgba(255, 255, 255, 0.89);
    }

   .mdl-layout__drawer {
      border: none !important;
   }

   .mdl-layout__drawer .mdl-navigation__link:hover {
      background-color: #00BCD4 !important;
      color: #37474F !important;
    }
   """


view : Model -> Html Msg
view model =
    Material.Scheme.top <|
        Layout.render Mdl
                model.mdl
                [ Layout.fixedHeader
                , Layout.fixedDrawer
                , Options.css "display" "flex !important"
                , Options.css "flex-direction" "row"
                , Options.css "align-items" "center"
                ]
                { header = [ viewHeader model ]
                , drawer = []
                , tabs = ( [], [] )
                , main =
                    [ viewBody model
                    , Snackbar.view model.snackbar |> Html.map Snackbar
                    ]
                }


viewHeader : Model -> Html Msg
viewHeader model =
    Layout.row
        [ Color.background <| Color.white
        , Color.text <| Color.color Color.Green Color.S500
        ]
        [ Layout.title []
            [ text "Here4"
            ]
        , Layout.spacer
        , Layout.navigation []
            []
        ]


viewBody : Model -> Html Msg
viewBody model =
    case model.history |> List.head |> Maybe.withDefault Nothing of
        Just Route.Home ->
            View.Home.view model

        Nothing ->
            text "404"

