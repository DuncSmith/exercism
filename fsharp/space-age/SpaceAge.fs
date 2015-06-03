module SpaceAge

type SpaceAge(seconds : decimal) =

  let secondsPerYear =
    [
      "earth", 31557600m;
      "mercury", 7600543.81992m;
      "venus", 19414149.052176m;
      "mars", 59354032.69008m;
      "jupiter", 374355659.124m;
      "saturn", 929292362.8848m;
      "uranus", 2651370019.3296m;
      "neptune", 5200418560.032m;
    ] |> Map.ofList

  let round2dp x = System.Math.Round(x |> float, 2)

  let planetaryYears planet =
    round2dp <| (seconds / secondsPerYear.[planet]);

  member this.Seconds = seconds

  member this.onEarth = planetaryYears "earth"

  member this.onMercury = planetaryYears "mercury"

  member this.onVenus = planetaryYears "venus"

  member this.onMars = planetaryYears "mars"

  member this.onSaturn = planetaryYears "saturn"

  member this.onJupiter = planetaryYears "jupiter"

  member this.onNeptune = planetaryYears "neptune"

  member this.onUranus = planetaryYears "uranus"
