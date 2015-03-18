module Bob

module Char =
  let isUppercase = (fun c -> Seq.exists ((=) c) {'A'..'Z'})

  let isLowercase = (fun c -> Seq.exists ((=) c) {'a'..'z'})

type Bob(greeting : string) =
  let (|Is|_|) predicate x = if predicate x then Some() else None

  let shout(str : string) =
    let someUppercase seq = Seq.exists Char.isUppercase seq
    let noneLowercase seq = not <| Seq.exists Char.isLowercase seq
    someUppercase str && noneLowercase str

  let question(str : string) =
    not <| Seq.isEmpty str && str |> Seq.last |> ((=) '?')

  let silence(str : string) =
    str |> Seq.skipWhile ((=) ' ') |> Seq.isEmpty

  member this.hey() =
    match greeting with
    | Is shout -> "Whoa, chill out!"
    | Is question -> "Sure."
    | Is silence -> "Fine. Be that way!"
    | _ -> "Whatever."
