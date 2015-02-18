(ns rna-transcription)

(defn- single-to-rna [c]
  (def rna-map {\A \U, \C \G, \G \C, \T \A})
  (assert (contains? rna-map c) (str "Unknown nucleotide: " c))
  (get rna-map c))

(defn to-rna [s] (apply str (map single-to-rna s)))
