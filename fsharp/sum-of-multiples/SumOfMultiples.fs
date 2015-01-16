module SumOfMultiples

type SumOfMultiples(divisors) =
  new() = SumOfMultiples [3;5]

  member this.To limit =
    let rec toTailRecursive limit sum =
      if limit <= 1 then
        sum
      else if this.IsMultipleOfAny (limit-1) divisors then
        toTailRecursive (limit-1) (sum + limit-1)
      else
        toTailRecursive (limit-1) sum
    toTailRecursive limit 0
  
  member this.IsMultipleOfAny value divisors =
    let isMultiple divisor = ((value % divisor) = 0)
    List.exists isMultiple divisors
