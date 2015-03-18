module Bob

type Bob(greeting : string) =

  let uppercase(str : string) = str.ToUpper().Equals(str)

  let alpha(str : string) =
    let alphas = ['a'..'z'] @ ['A'..'Z']
    str |> Seq.exists (fun c -> alphas |> Seq.exists ((=) c))

  let (|Is|_|) predicate x = if predicate x then Some() else None

  let shout(str : string) = uppercase str && alpha str

  let question(str : string) = str.EndsWith "?"

  let silence(str : string) = str.Trim().Equals ""

  member this.hey() =
    match greeting with
    | Is shout -> "Whoa, chill out!"
    | Is question -> "Sure."
    | Is silence -> "Fine. Be that way!"
    | _ -> "Whatever."
