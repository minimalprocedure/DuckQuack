# encoding: utf-8
################################################################################
## Initial developer: Massimo Maria Ghisalberti <massimo.ghisalberti@gmail.org>
## Date: 2017-03-02
## Company: Pragmas <contact.info@pragmas.org>
## Licence: Apache License Version 2.0, http://www.apache.org/licenses/
################################################################################

module Mesh3dHelpers

  def mesh_reset(mesh, x, y, z, rot_x, rot_y, rot_z)
    mesh.setTranslateX(x)
    mesh.setTranslateY(y)
    mesh.setTranslateZ(z)
    mesh.getTransforms.add(Rotate.new(rot_x, 0, 0, 0, Rotate::X_AXIS))
    mesh.getTransforms.add(Rotate.new(rot_y, 0, 0, 0, Rotate::Y_AXIS))
    mesh.getTransforms.add(Rotate.new(rot_z, 0, 0, 0, Rotate::Z_AXIS))
    mesh
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
