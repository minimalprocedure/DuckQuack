
pattern = create_music_patterns([
  "V0 I[Piano] Eq Ch. | Eq Ch. | Dq Eq Dq Cq",
  "V1 I[Flute] Rw | Rw | GmajQQQ CmajQ"
])

create_music_player(
  :pattern => pattern
)