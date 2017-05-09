module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)


main : Program Never Int Msg
main =
    beginnerProgram
        { model = 0
        , update = update
        , view = view
        }


type Msg
    = Increment
    | Decrement


update : Msg -> Int -> Int
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


view : Int -> Html Msg
view count =
    div []
        [ h1 [] [ text "Prairie Chicken, Lesser" ]
        , h2 [] [ text "An Accounting of Hens" ]
        , div []
            [ text (formatChickenCount count)
            ]
        , viewIncrementButton
        , if count > 0 then
            viewDecrementButton
          else
            text ""
        ]


formatChickenCount : Int -> String
formatChickenCount count =
    if count == 1 then
        "There is 1 chicken."
    else
        "There are " ++ toString count ++ " chickens."


viewIncrementButton : Html Msg
viewIncrementButton =
    button [ onClick Increment ] [ text "I see a new lesser prairie chicken!!!" ]


viewDecrementButton : Html Msg
viewDecrementButton =
    button [ onClick Decrement ] [ text "RIP Chicken." ]
