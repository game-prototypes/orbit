tool
class_name Orbit
extends Node2D

const orbit_speed=0.1
const orbit_click_padding=20

export var radius=200
export var orbit_color:Color
export var highlight_color:Color

export var quality:int=128

var ships=[]

var show_highlight=false

func _ready() -> void:
	var donut_collider:DonutCollisionPolygon2D=$Area2D/DonutCollisionPolygon2D
	donut_collider.radius=radius

func _process(delta):
	if not Engine.editor_hint:
		self.rotate(orbit_speed*delta)
	update()

func _draw():
	draw_circle_arc(Vector2.ZERO, radius, 0, 360, orbit_color, 1)
	if show_highlight:
		draw_circle_arc(Vector2.ZERO, radius, 0, 360, highlight_color, 8)

func draw_circle_arc(center, radius, angle_from, angle_to, color, width=1.0):
	var nb_points = 16
	var points_arc = []

	for i in range(quality + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / quality - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	for index_point in range(quality):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color, width)

func get_planet() -> Planet:
	return $".." as Planet

func add_ship(ship) -> void:
	ships.append(ship)
	add_child(ship)
	var ship_degrees=rand_range(0, 359)
	var ship_radians=deg2rad(ship_degrees)

	var x = radius*cos(ship_radians);
	var y = radius*sin(ship_radians);

	ship.position=Vector2(x,y)

	ship.rotation_degrees=ship_degrees

func _on_click(button_index) -> void:
	HUD.display_orbit_info(self)

func _on_mouse_entered() -> void:
	show_highlight=true

func _on_mouse_exited():
	show_highlight=false
