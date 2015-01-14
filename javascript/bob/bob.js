//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {};

Bob.prototype.hey = function(input) {
  if (isShout(input)) {
    return 'Woah, chill out!';
  }
  if (isQuestion(input)) {
    return 'Sure.';
  }
  if (isSilence(input)) {
    return 'Fine. Be that way!';
  }
  return 'Whatever.';
};
  
function isShout(input) {
  return isUpperCase(input) && containsLetters(input);
}
  
function isUpperCase(input) {
  return input === input.toUpperCase();
}
  
function containsLetters(input) {
  return input.match(/[A-Z]/i);
}
  
function isQuestion(input) {
  return endsWith(input, '?');
}

function endsWith(input, ending) {
  var lastIndex = input.lastIndexOf(ending);
  return lastIndex !== -1 && lastIndex === (input.length - ending.length);
}
  
function isSilence(input) {
  return input.trim() === "";
}

module.exports = Bob;
