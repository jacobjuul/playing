module Types exposing (..)


type alias Model =
    { name : String
    , gameNumber : String
    , entries : List Entry
    }


type alias Entry =
    { id : Int
    , phrase : String
    , points : Int
    , marked : Bool
    }
