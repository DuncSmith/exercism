(ns rna-transcription)

(defn- single-to-rna [c]
  (assert (some #{c} [\A \C \G \T]) (str "Unknown nucleotide: " c))
  (case c
    \A \U
    \C \G
    \G \C
    \T \A))

(defn to-rna [s] (apply str (map single-to-rna s)))
