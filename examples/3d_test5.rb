#-*- ruby -*-

reimposta

oggetti = mesh_create('file://' + File.join(pwd, 'images/torus.obj'))


slider_create(x: 10, y:10, min:0, max:360, position:0) {|pos|
  oggetti.each {|mesh|
    mesh.rotate_x(pos.value)
  }
}

slider_create(x: 10, y:40, min:0, max:360, position:0) {|pos|
  oggetti.each {|mesh|
    mesh.rotate_y(pos.value)
  }
}

slider_create(x: 10, y:70, min:0, max:360, position:0) {|pos|
  oggetti.each {|mesh|
    mesh.rotate_z(pos.value)
  }
}