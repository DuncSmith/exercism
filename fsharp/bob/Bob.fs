module Bob

type Bob(greeting : string) =

  member this.hey() = 
    if this.shouted() then "Whoa, chill out!"
    else if this.question() then "Sure."
    else if this.silence() then "Fine. Be that way!"
    else "Whatever."

  member private this.shouted() = 
    this.uppercase() && not(this.lowercase())

  member private this.uppercase() = greeting.ToUpper().Equals(greeting)

  member private this.lowercase() = greeting.ToLower().Equals(greeting)

  member private this.question() = greeting.EndsWith("?")

  member private this.silence() = greeting.Trim().Equals("")
