module Bob

type Bob(greeting : string) =

  let uppercase(str:string) = str.ToUpper().Equals(str)

  let lowercase(str:string) = str.ToLower().Equals(str)

  let (|Shout|_|) (str : string) = 
    if uppercase(str) && not(lowercase(str)) 
    then Some("Whoa, chill out!")
    else None

  let (|Question|_|) (str : string) = 
    if str.EndsWith("?") then Some("Sure.") else None

  let (|Silence|_|) (str : string) = 
    if str.Trim().Equals("") then Some("Fine. Be that way!") else None

  member this.hey() =
    match greeting with
      | Shout response -> response
      | Question response -> response
      | Silence response -> response
      | _ -> "Whatever."
