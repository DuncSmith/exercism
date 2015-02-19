module DifferenceOfSquares

type DifferenceOfSquares(valueUpTo) =

  static let square x = x * x

  member this.squareOfSums() = square (List.sum [1..valueUpTo])

  member this.sumOfSquares() = List.sumBy square [1..valueUpTo]

  member this.difference() = this.squareOfSums() - this.sumOfSquares()
