module Bingo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Entry, Model)


initialModel =
    { name = "Jacob"
    , gameNumber = "1"
    , entries = initialEntries
    }


initialEntries : List Entry
initialEntries =
    [ Entry 1 "First Entry" 100 False
    , Entry 3 "Second entry" 200 True
    , Entry 4 "fourth entry" 200 True
    , Entry 5 "fifth entry" 200 True
    ]


playerInfo : Model -> String
playerInfo { name, gameNumber } =
    name ++ " - Game #" ++ gameNumber


viewHeader : String -> Html msg
viewHeader title =
    header []
        [ h1 [] [ text title ] ]


viewPlayer : String -> String -> Html msg
viewPlayer name gameNumber =
    let
        playerInfoText =
            text << String.toUpper << playerInfo
    in
        h2 [ id "info", class "classy" ]
            [ playerInfoText
                { name = name
                , gameNumber = gameNumber
                , entries = initialEntries
                }
            ]


viewFooter : Html msg
viewFooter =
    footer []
        [ a [ href "http://react.com" ] [ text "ReactJS" ]
        , a [ href "http://actitor.com" ] [ text "Actitor" ]
        ]


viewEntryListItem : Entry -> Html msg
viewEntryListItem entry =
    li []
        [ span [ class "phrase" ] [ text entry.phrase ]
        , span [ class "points" ] [ text (toString entry.points) ]
        ]


viewEntryList : List Entry -> Html msg
viewEntryList entries =
    let
        listEntries =
            List.map viewEntryListItem entries
    in
        ul [] listEntries


view : Model -> Html msg
view model =
    div [ class "content" ]
        [ viewHeader "Jacob"
        , viewPlayer model.name model.gameNumber
        , viewEntryList model.entries
        , div [ class "debug" ] [ text (toString model) ]
        , viewFooter
        ]


main : Html msg
main =
    view initialModel
