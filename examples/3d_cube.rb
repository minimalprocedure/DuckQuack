#-*- ruby -*-
import javafx.scene.shape.Sphere
import javafx.scene.shape.Box
import javafx.scene.paint.PhongMaterial
import javafx.scene.PerspectiveCamera
import javafx.scene.control.Slider
import javafx.scene.transform.Rotate

reimposta

camera = PerspectiveCamera.new(false)
camera.setTranslateX(0)
camera.setTranslateY(0)
camera.setTranslateZ(-40)
camera_group = Group.new
camera_group.get_children.add(camera)
@container.getChildren.add(camera_group)
#@container.get_scene.setCamera(camera) # <error line comment>

material = PhongMaterial.new;  
material.setDiffuseColor(Color::BLANCHEDALMOND); 
material.setDiffuseMap(Image.new("file://" + File.join(pwd, "images/paperella-64.png")))
box = Box.new(100, 100, 100)
box = Sphere.new(100, 100)
box.setMaterial(material)
box.setTranslateX(300)
box.setTranslateY(300)
box.setTranslateZ(300)
box.getTransforms.add(Rotate.new(0, 0, 0, 0, Rotate::X_AXIS))
box.getTransforms.add(Rotate.new(0, 0, 0, 0, Rotate::Y_AXIS))
box.getTransforms.add(Rotate.new(0, 0, 0, 0, Rotate::Z_AXIS))
@container.getChildren.add(box)

slider_create(x: 10, y:10, min:0, max:360, position:0) {|pos|
  box.getTransforms.add(Rotate.new(pos.value, 0, 0, 0, Rotate::X_AXIS))
}

slider_create(x: 10, y:40, min:0, max:360, position:0) {|pos|
  box.getTransforms.add(Rotate.new(pos.value, 0, 0, 0, Rotate::Y_AXIS))
}

slider_create(x: 10, y:70, min:0, max:360, position:0) {|pos|
  box.getTransforms.add(Rotate.new(pos.value, 0, 0, 0, Rotate::Z_AXIS))
}
