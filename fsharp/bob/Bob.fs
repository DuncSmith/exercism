module Bob

type Bob(greeting : string) =
  let (-&-) (first : 'a -> bool) (second : 'a -> bool) =
    fun x -> first x && second x

  let contains x seq = seq |> Seq.exists ((=) x)

  let uppercase c = {'A'..'Z'} |> contains c

  let lowercase c = {'a'..'z'} |> contains c

  let someUppercase seq = seq |> Seq.exists uppercase

  let noneLowercase seq = seq |> Seq.forall (not << lowercase)

  let (|Is|_|) predicate x = if predicate x then Some() else None

  let shout(str : string) = str |> (someUppercase -&- noneLowercase)

  let question(str : string) = str.EndsWith "?"

  let silence(str : string) = str.Trim().Equals ""

  member this.hey() =
    match greeting with
    | Is shout -> "Whoa, chill out!"
    | Is question -> "Sure."
    | Is silence -> "Fine. Be that way!"
    | _ -> "Whatever."
