module LListTests exposing (..)

import Expect
import Fuzz
import LList
import List
import Test exposing (..)


isEmpty : Test
isEmpty =
    describe "isEmpty"
        [ test "should be true for empty lists" <|
            \() ->
                LList.isEmpty LList.empty
                    |> Expect.equal True
        , test "should be false for non-empty lists" <|
            \() ->
                LList.isEmpty (LList.singleton 1)
                    |> Expect.equal False
        ]


singletonList =
    LList.singleton 1


length : Test
length =
    describe "length"
        [ test "empty list should have length 0" <|
            \() ->
                LList.length LList.empty
                    |> Expect.equal 0
        , test "singleton list should have length 1" <|
            \_ ->
                LList.length singletonList |> Expect.equal 1
        , test "list length 2 should have length 2" <|
            \_ ->
                LList.length (LList.Cons 1 singletonList) |> Expect.equal 2
        ]


member : Test
member =
    describe "member"
        [ test "empty list has no members" <|
            \_ ->
                LList.member "ELM" LList.empty |> Expect.equal False
        , fuzz Fuzz.int "singleton list of a different integer returns false for the current integer" <|
            \i ->
                LList.singleton (i + 1) |> LList.member i |> Expect.equal False
        , fuzz Fuzz.int "singleton list of an integer returns true for the current integer" <|
            \i ->
                LList.singleton i |> LList.member i |> Expect.equal True
        , fuzz Fuzz.int "list of length two returns true if the second item is in the list" <|
            \i ->
                LList.Cons 0 (LList.Cons i LList.Empty)
                    |> LList.member i
                    |> Expect.equal True
        ]


head : Test
head =
    describe "head"
        [ test "empty list returns Nothing" <|
            \_ ->
                LList.empty
                    |> LList.head
                    |> Expect.equal Nothing
        , test "singleton list returns `Just value`" <|
            \_ ->
                singletonList
                    |> LList.head
                    |> Expect.equal (Just 1)
        ]


tail : Test
tail =
    describe "tail"
        [ test "empty list returns Nothing" <|
            \_ ->
                LList.empty
                    |> LList.tail
                    |> Expect.equal Nothing
        , test "singleton list returns an empty list" <|
            \_ ->
                LList.singleton 1
                    |> LList.tail
                    |> Expect.equal
                        (Just LList.Empty)
        , test "list of 2 items returns singleton containing the 2nd item" <|
            \_ ->
                LList.singleton 1
                    |> LList.Cons 2
                    |> LList.tail
                    |> Expect.equal
                        (Just <| LList.singleton 1)
        ]


all : Test
all =
    concat
        [ isEmpty
        , length
        , member
        , head
        , tail
        ]
