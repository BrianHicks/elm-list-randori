module LList exposing (..)

import List as AList


type List a
    = Cons a (List a)
    | Empty


empty : List a
empty =
    Empty


singleton : a -> List a
singleton a =
    Cons a empty


isEmpty : List a -> Bool
isEmpty =
    (==) Empty


length : List a -> Int
length list =
    case list of
        Empty ->
            0

        Cons _ xs ->
            1 + length xs


member : a -> List a -> Bool
member item list =
    case list of
        Empty ->
            False

        Cons x xs ->
            if x == item then
                True
            else
                member item xs


head : List a -> Maybe a
head list =
    case list of
        Empty ->
            Nothing

        Cons x _ ->
            Just x


tail : List a -> Maybe (List a)
tail list =
    case list of
        Empty ->
            Nothing

        Cons _ xs ->
            Just xs
