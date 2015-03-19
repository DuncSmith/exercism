module Bob

module Char =
  let isAlpha c = Seq.exists ((=) c) (['A'..'Z'] @ ['a'..'z'])

  let isLowercase c = Seq.exists ((=) c) {'a'..'z'}

let someIf condition = if condition then Some() else None

type Bob(greeting) =
  let (|Shout|_|) str =
    let someAlpha str = Seq.exists Char.isAlpha str
    let noneLowercase str = not <| Seq.exists Char.isLowercase str
    someIf(someAlpha str && noneLowercase str)

  let (|Question|_|) (str : string) =
    someIf(not <| Seq.isEmpty str && str |> Seq.last |> ((=) '?'))

  let (|Silence|_|) (str : string) =
    someIf(str |> Seq.skipWhile ((=) ' ') |> Seq.isEmpty)

  member this.hey() =
    match greeting with
    | Shout -> "Whoa, chill out!"
    | Question -> "Sure."
    | Silence -> "Fine. Be that way!"
    | _ -> "Whatever."
