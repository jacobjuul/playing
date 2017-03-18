module Bingo exposing (..)

import Html exposing (..)


type alias Player =
    { name : String
    , number : String
    }


playerInfo : Player -> String
playerInfo { name, number } =
    name ++ " -Game #" ++ number


main : Html msg
main =
    playerInfoText { name = "Jacob", number = "1" }


playerInfoText : Player -> Html msg
playerInfoText =
    text << String.toUpper << playerInfo
