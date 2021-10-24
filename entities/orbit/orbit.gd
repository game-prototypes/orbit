tool
extends Node2D

const orbit_speed=0.1
const orbit_click_padding=20

export var radius=200
export var orbit_color:Color

export var quality:int=128

var ships=[]

func _ready() -> void:
	var collisionShape:CollisionShape2D=$Area2D/CollisionShape2D
	var orbitColliderShape:=CircleShape2D.new()
	orbitColliderShape.radius=radius+orbit_click_padding
	collisionShape.shape=orbitColliderShape
	$Area2D.ignore_center_radius=radius-orbit_click_padding

func _process(delta):
	if not Engine.editor_hint:
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
	print("CLICK Orbit")


func _on_mouse_entered() -> void:
	print("Mouse entered")
