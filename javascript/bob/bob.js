var Bob = (function () {
  var Bob;
  var isShout, isUpperCase, containsLetters, isQuestion, endsWith, isSilence;

  Bob = function () { return this; };

  Bob.prototype.hey = function (input) {
    if (isShout(input)) {
      return 'Whoa, chill out!';
    }
    if (isQuestion(input)) {
      return 'Sure.';
    }
    if (isSilence(input)) {
      return 'Fine. Be that way!';
    }
    return 'Whatever.';
  };

  isShout = function (input) {
    return isUpperCase(input) && containsLetters(input);
  };

  isUpperCase = function (input) {
    return input === input.toUpperCase();
  };

  containsLetters = function (input) {
    return input.match(/[A-Z]/i);
  };

  isQuestion = function (input) {
    return endsWith('?', input);
  };

  endsWith = function (endChar, input) {
    return input.slice(-1) === endChar;
  };

  isSilence = function (input) {
    return input.trim() === "";
  };

  return Bob;
}());

module.exports = Bob;
