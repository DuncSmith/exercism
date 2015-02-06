(ns bob
  (:require [clojure.string :as string]))

(defn- alphabetic? [s]
  (re-find #"\p{Alpha}" s))

(defn- upper-case? [s]
  (= s (string/upper-case s)))

(defn- ends-with? [c s]
  (= (last s) c))
  
(defn- silence? [s]
  (string/blank? s))
  
(defn- shout? [s]
  (and (alphabetic? s) (upper-case? s)))
  
(defn- question? [s]
  (ends-with? \? s))

(defn response-for [s]
  (cond
    (silence? s) "Fine. Be that way!"
    (shout? s) "Woah, chill out!"
    (question? s) "Sure."
    :else "Whatever."))
