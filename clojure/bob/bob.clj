(ns bob)

(declare question? ends-with?)

(defn response-for [s] 
  (cond
    (question? s) "Sure." 
    :else "Whatever."))

(defn- question? [s] 
  (ends-with? \? s))

(defn- ends-with? [c s] 
  (= (last (seq s)) c))
