(ns string
  (:require [clojure.string :as string]))

(defn alphabetic? [s]
  (re-find #"\p{Alpha}" s))

(defn upper-case? [s]
  (= s (string/upper-case s)))

(defn ends-with? [c s]
  (= (last s) c))

(defn blank? [s]
  (string/blank? s))


(ns phrase
  (:require [string]))

(defn silence? [s]
  (string/blank? s))

(defn shout? [s]
  (and (string/alphabetic? s) (string/upper-case? s)))

(defn question? [s]
  (string/ends-with? \? s))


(ns bob
  (:require [clojure.string :as string]
            [phrase]))

(defn response-for [s]
  (cond
    (phrase/silence? s) "Fine. Be that way!"
    (phrase/shout? s) "Woah, chill out!"
    (phrase/question? s) "Sure."
    :else "Whatever."))
