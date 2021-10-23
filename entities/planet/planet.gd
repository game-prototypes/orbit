class_name Planet
extends Node2D

export var planet_name:String
export var gravity:float=9.8
export var radius:float=130

export(PackedScene) var ship_scene

onready var orbit=$Orbit

var ships=[]

func _ready() -> void:
	build_ship()
	build_ship()

func toggle_info():
	HUD.display_planet_info(self)

func build_ship():
	var ship=ship_scene.instance()
	ships.append(ship)

func _on_click(_button_index) -> void:
	toggle_info()

func can_launch_ship() -> bool:
	return !ships.empty()

func launch_ship() -> void:
	orbit.add_ship(ships.pop_back())
