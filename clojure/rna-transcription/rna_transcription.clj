(ns rna-transcription)

(defn- single-to-rna [c]
  (assert (some #{c} [\A \C \G \T]) (str "Unknown nucleotide: " c))
  (cond 
    (= c \A) \U
    (= c \C) \G
    (= c \G) \C
    (= c \T) \A))

(defn to-rna [s] (apply str (map single-to-rna s)))
