# encoding: utf-8
################################################################################
## Initial developer: Massimo Maria Ghisalberti <massimo.ghisalberti@gmail.org>
## Date: 2017-03-02
## Company: Pragmas <contact.info@pragmas.org>
## Licence: Apache License Version 2.0, http://www.apache.org/licenses/
################################################################################

module Mesh3dHelpers

  import com.interactivemesh.jfx.importer.obj.ObjModelImporter

  #Extended Node class for rotation
  class javafx.scene::Node
    def rotate2d(angle)
      getTransforms.add(Rotate.new(angle))
    end

    def rotate2d_p(angle, pivot_x = 0, pivot_y = 0)
      getTransforms.add(Rotate.new(angle, pivot_x, pivot_y))
    end

    def rotate_x(angle, pivot_x = 0, pivot_y = 0, pivot_z = 0)
      getTransforms.add(
        Rotate.new(angle, pivot_x, pivot_y, pivot_z, Rotate::X_AXIS))
    end

    def rotate_y(angle, pivot_x = 0, pivot_y = 0, pivot_z = 0)
      getTransforms.add(
        Rotate.new(angle, pivot_x, pivot_y, pivot_z, Rotate::Y_AXIS))
    end

    def rotate_z(angle, pivot_x = 0, pivot_y = 0, pivot_z = 0)
      getTransforms.add(
        Rotate.new(angle, pivot_x, pivot_y, pivot_z, Rotate::Z_AXIS))
    end
  end

  def mesh_reset(mesh, x, y, z, rot_x, rot_y, rot_z)
    mesh.setTranslateX(x)
    mesh.setTranslateY(y)
    mesh.setTranslateZ(z)
    mesh.rotate_x(rot_x)
    mesh.rotate_y(rot_y)
    mesh.rotate_z(rot_z)
    mesh
  end

  def mesh_create(mesh_file, opts = {})
    params = {
      :x => 0,
      :y => 0,
      :z => 0,
      :scale => 250,
      :material => nil,
      :parent => nil
    }.deep_merge(opts)
    importer = ObjModelImporter.new
    importer.read(mesh_file)
    meshes = importer.get_import
    meshes.each { |m|
      tm_point = m.get_mesh.get_points
      m.setScaleX(params[:scale])
      m.setScaleY(params[:scale])
      m.setScaleZ(params[:scale])
      m.setMaterial(params[:material]) if params[:material]
      parent_bounds = control_add(m, :parent => params[:parent], :bounds => false).get_bounds_in_parent
      point = DrawingHelpers::PointRelative.new(params[:x] + tm_point.get(0), params[:y] + tm_point.get(1), parent_bounds)
      mesh_reset(m, point.absolute_x, point.absolute_y, params[:z] + tm_point.get(2), 0, 0, 0)
    }
    meshes
  end

  def box_create(dim_z, dim_y, dim_x, opts = {})
    params = {
      :x => 0,
      :y => 0,
      :z => 0,
      :material => nil,
      :parent => nil
    }.deep_merge(opts)
    c = Box.new(dim_z, dim_y, dim_x)
    c.setMaterial(params[:material]) if params[:material]
    mesh_reset(c, params[:x], params[:y], params[:z], 0, 0, 0)
    control_add(c, :parent => params[:parent], :bounds => true)
    c
  end

  def sphere_create(radius, division, opts = {})
    params = {
      :x => 0,
      :y => 0,
      :z => 0,
      :material => nil,
      :parent => nil
    }.deep_merge(opts)
    c = Sphere.new(radius, division)
    c.setMaterial(params[:material]) if params[:material]
    mesh_reset(c, params[:x], params[:y], params[:z], 0, 0, 0)
    control_add(c, :parent => params[:parent], :bounds => true)
    c
  end

  def cylinder_create(radius, height, division, opts = {})
    params = {
      :x => 0,
      :y => 0,
      :z => 0,
      :material => nil,
      :parent => nil
    }.deep_merge(opts)
    c = Cylinder.new(radius, height, division)
    c.setMaterial(params[:material]) if params[:material]
    mesh_reset(c, params[:x], params[:y], params[:z], 0, 0, 0)
    control_add(c, :parent => params[:parent], :bounds => true)
    c
  end

  def material_create(opts = {})
    params = {
      :diffuse_color => Color::WHITE,
      :bump_map => nil,
      :diffuse_map => nil,
      :illumination_map => nil,
      :specular_map => nil,
      :specular_color => nil,
      :specular_power => 32.0
    }.deep_merge(opts)
    m = PhongMaterial.new
    m.set_diffuse_color(params[:diffuse_color])
    m.set_bump_map(Image.new(params[:bump_map])) if params[:bump_map]
    m.set_diffuse_map(Image.new(params[:diffuse_map])) if params[:diffuse_map]
    m.set_self_illumination_map(Image.new(params[:illumination_map])) if params[:illumination_map]
    m.set_specular_color(params[:specular_color]) if params[:specular_color]
    m.set_specular_power(params[:specular_power])
    m
  end

end
