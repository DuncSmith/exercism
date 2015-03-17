module Bob

type Bob(greeting : string) =

  let uppercase(str:string) = str.ToUpper().Equals(str)

  let lowercase(str:string) = str.ToLower().Equals(str)

  let (|Shout|_|) (str : string) =
    if uppercase(str) && not(lowercase(str)) then Some() else None

  let (|Question|_|) (str : string) =
    if str.EndsWith("?") then Some() else None

  let (|Silence|_|) (str : string) =
    if str.Trim().Equals("") then Some() else None

  member this.hey() =
    match greeting with
      | Shout -> "Whoa, chill out!"
      | Question -> "Sure."
      | Silence -> "Fine. Be that way!"
      | _ -> "Whatever."
