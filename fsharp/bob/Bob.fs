module Bob

module Char =
  let isAlpha c = Seq.exists ((=) c) <| Seq.append {'A'..'Z'} {'a'..'z'}

  let isLowercase c = Seq.exists ((=) c) {'a'..'z'}

let (|Is|_|) predicate x = if predicate x then Some() else None

type Bob(greeting) =
  let shout str =
    let someAlpha str = Seq.exists Char.isAlpha str
    let noneLowercase str = not <| Seq.exists Char.isLowercase str
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
