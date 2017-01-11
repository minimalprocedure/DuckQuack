pulisci

draw_axis

  def translate_coord(x, y, canvas = @canvas)
    bounds = canvas.get_bounds_in_local
    width = round_to_even(bounds.width)
    height = round_to_even(bounds.height)
    x0 = width / 2
    y0 = height / 2
    [x0 + x, y0 + -y]
  end

x, y = translate_coord(0,0)
beginPath
arco(x, y, 6, 6, 0, 360)
closePath
setFill(Color.rgb(255,0,255))
fill

x, y = translate_coord(20,20)
beginPath
arco(x, y, 6, 6, 0, 360)
closePath
setFill(Color.rgb(255,0,255))
fill

x, y = translate_coord(20,-20)
beginPath
arco(x, y, 6, 6, 0, 360)
closePath
setFill(Color.rgb(255,0,255))
fill

bounds = canvas.get_bounds_in_local
width = round_to_even(bounds.width)
height = round_to_even(bounds.height)

x, y = translate_coord(-30,0)
set_line_width(2)
set_stroke(Color::RED)
stroke_line(x, y, x, height / 2 - 100)