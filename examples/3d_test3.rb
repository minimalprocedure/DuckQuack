#-*- ruby -*-

reimposta

materiale = nuovo_materiale(
  diffuse_color:Color::WHITE,
  diffuse_map:"file://" + File.join(pwd, "images/paperella-64.png")
)
mesh = nuova_sfera(100, 100, x:300, y:300, z:300, material:materiale)
mesh2 = nuovo_cubo(100, 100, 100, x:100, y:200, z:100, material:materiale)

gruppo = raggruppa_oggetti([mesh, mesh2])

slider_create(x: 10, y:10, min:-10, max:360, position:0) {|pos|
  gruppo.getTransforms.add(Rotate.new(pos.value, 0, 0, 0, Rotate::X_AXIS))
}

slider_create(x: 10, y:40, min:0, max:360, position:0) {|pos|
  gruppo.getTransforms.add(Rotate.new(pos.value, 0, 0, 0, Rotate::Y_AXIS))
}

slider_create(x: 10, y:70, min:0, max:360, position:0) {|pos|
  gruppo.getTransforms.add(Rotate.new(pos.value, 0, 0, 0, Rotate::Z_AXIS))
}
