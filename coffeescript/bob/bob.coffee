class Bob
  hey: (said) ->
    return 'Fine. Be that way!' if @silence(said)
    return 'Woah, chill out!' if @shouting(said)
    return 'Sure.' if @question(said)
    'Whatever.'

  silence: (said) -> said.trim() == ''

  shouting: (said) -> @upperCase(said) && @containsLetters(said)

  question: (said) -> @endsWith('?', said)

  upperCase: (said) -> said == said.toUpperCase()

  containsLetters: (said) -> said.match(/[A-Z]/i)

  endsWith: (ending, value) -> 
    value.length >= ending.length && 
    value.lastIndexOf(ending) == (value.length - ending.length)

module.exports = Bob
