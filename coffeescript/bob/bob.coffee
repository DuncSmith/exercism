class Bob
  hey: (said) ->
    return 'Woah, chill out!' if @shouting(said)
    'Whatever.'

  shouting: (said) -> said == said.toUpperCase()

module.exports = Bob
