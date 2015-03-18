module Bob

module Char =
  let isAlpha c = Seq.exists ((=) c) (['A'..'Z'] @ ['a'..'z'])

  let isLowercase c = Seq.exists ((=) c) {'a'..'z'}

let (|Is|_|) predicate x = if predicate x then Some() else None

type Bob(greeting) =
  let shout str =
    let someAlpha seq = Seq.exists Char.isAlpha seq
    let noneLowercase seq = not <| Seq.exists Char.isLowercase seq
    someAlpha str && noneLowercase str

  let question str =
    not <| Seq.isEmpty str && str |> Seq.last |> ((=) '?')

  let silence str =
    str |> Seq.skipWhile ((=) ' ') |> Seq.isEmpty

  member this.hey() =
    match greeting with
    | Is shout -> "Whoa, chill out!"
    | Is question -> "Sure."
    | Is silence -> "Fine. Be that way!"
    | _ -> "Whatever."
