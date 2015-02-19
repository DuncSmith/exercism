(ns rna-transcription)

(defn to-rna [s] 
  (def rna-map {\A \U, \C \G, \G \C, \T \A})
  (assert (every? (partial contains? rna-map) s) (str "Invalid RNA strand: " s))
  (apply str (map rna-map s)))
