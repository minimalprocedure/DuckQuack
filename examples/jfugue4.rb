#JFugue example
#Use "Replacement Maps" to Generate Fractal Music
#http://www.jfugue.org/examples.html

rules = {
  "Cmajw" => "Cmajw Fmajw",
  "Fmajw" => "Rw Bbmajw",
  "Bbmajw" => "Rw Fmajw",
  "C5q" => "C5q G5q E6q C6q",
  "E6q" => "G6q D6q F6i C6i D6q",
  "G6i+D6i" => "Rq Rq G6i+D6i G6i+D6i Rq",
  "spartito" => "axiom V0 I[Flute] Rq C5q V1 I[Tubular_Bells] Rq Rq Rq G6i+D6i V2 I[Piano] Cmajw E6q V3 I[Warm] E6q G6i+D6i V4 I[Voice] C5q E6q"
}

spartito = spartito_musicale([
  "T120",
  "V0 I[Flute] Rq C5q",
  "V1 I[Tubular_Bells] Rq Rq Rq G6i+D6i",
  "V2 I[Piano] Cmajw E6q",
  "V3 I[Warm] E6q G6i+D6i",
  "V4 I[Voice] C5q E6q"
])

sostituzioni_spartito(rules, spartito, iteration: 10)

esecutore = esecutore_musicale(spartito)

bottone = nuovo_bottone("pausa", x: 10, y: 200) { |evento| 
  esecutore.pause
}

bottone = nuovo_bottone("start", x: 10, y: 230) { |evento|
  esecutore.resume
}

bottone = nuovo_bottone("finish", x: 10, y: 260) { |evento|
  esecutore.finish
}