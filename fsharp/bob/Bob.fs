module Bob

type Bob(greeting : string) =

  let uppercase(str : string) = str.ToUpper().Equals(str)

  let lowercase(str : string) = str.ToLower().Equals(str)

  let someIf(condition) = if condition then Some() else None

  let (|Shout|_|) (str : string) =
    someIf(uppercase(str) && not(lowercase(str)))

  let (|Question|_|) (str : string) = someIf(str.EndsWith("?"))

  let (|Silence|_|) (str : string) = someIf(str.Trim().Equals(""))

  member this.hey() =
    match greeting with
    | Shout -> "Whoa, chill out!"
    | Question -> "Sure."
    | Silence -> "Fine. Be that way!"
    | _ -> "Whatever."
