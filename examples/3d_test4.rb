#-*- ruby -*-

reimposta

materiale = nuovo_materiale(
  diffuse_color:Color::WHITE,
  diffuse_map:"file://" + File.join(pwd, "images/paperella-64.png")
)
mesh = nuova_sfera(100, 100, x:300, y:300, z:300, material:materiale)

mesh2 = nuovo_cubo(100, 100, 100, x:100, y:200, z:100, material:materiale)

slider_create(x: 10, y:10, min:0, max:360, position:0) {|pos|
  mesh.rotate_z(pos.value)
  mesh2.rotate_z(pos.value)
}

slider_create(x: 10, y:40, min:0, max:360, position:0) {|pos|
  mesh.rotate_z(pos.value)
  mesh2.rotate_z(pos.value)
}

slider_create(x: 10, y:70, min:0, max:360, position:0) {|pos|
  mesh.rotate_z(pos.value)
  mesh2.rotate_z(pos.value)
}
