module Bob

type Bob(greeting : string) =

  let (|Is|_|) predicate x = if predicate(x) then Some() else None

  let uppercase(str : string) = str.ToUpper().Equals(str)

  let lowercase(str : string) = str.ToLower().Equals(str)

  let shout (str : string) = uppercase(str) && not(lowercase(str))

  let question (str : string) = str.EndsWith("?")

  let silence (str : string) = str.Trim().Equals("")

  member this.hey() =
    match greeting with
    | Is shout -> "Whoa, chill out!"
    | Is question -> "Sure."
    | Is silence -> "Fine. Be that way!"
    | _ -> "Whatever."
