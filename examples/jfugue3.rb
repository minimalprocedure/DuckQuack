
ritmo = ritmo_musicale([
  "O..oO...O..oOO..",
  "..S...S...S...S.",
  "````````````````",
  "...............+"
], repeat: 1, misure: 10)


spartito = spartito_musicale([
  "V0 I[Piano] Eq Ch. | Eq Ch. | Dq Eq Dq Cq",
  "V1 I[Flute] Rw | Rw | GmajQQQ CmajQ",
  ritmo
])

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