extends Node2D

var orbit_speed=1
export var radius=8
export var orbit_color:Color

export var quality:int=32

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotate(orbit_speed*delta)
	update()


func _draw():
	draw_circle_arc(Vector2.ZERO, radius, 0, 360, orbit_color)



func draw_circle_arc(center, radius, angle_from, angle_to, color):
	var nb_points = 16
	var points_arc = []

	for i in range(quality + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / quality - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	for index_point in range(quality):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color)
