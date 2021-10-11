extends Node2D

onready var trail:Line2D = $Trail
onready var trail_length: int = 100


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trail.set_as_toplevel(true)
	trail.clear_points()

func _physics_process(delta):
	#trail.add_point(self.global_position)
	if trail.get_point_count() > trail_length:
		trail.remove_point(0)
