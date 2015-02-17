class Bob
  hey: (said) ->
    return 'Woah, chill out!' if shouting(said)
    'Whatever.'

  shouting: (said) -> true

module.exports = Bob
