extends Node2D


export var gravity:float=9.8
export var radius:float=130

onready var ship=$Ship

func _ready():
	ship.position=Vector2(0,-radius)
	ship.rotation_degrees=0
