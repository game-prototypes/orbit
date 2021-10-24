extends Area2D

export var ignore_center_radius=0

signal on_click(button_index)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		var distance=self.global_position.distance_to(get_local_mouse_position())
		if distance>=ignore_center_radius:
			emit_signal("on_click", event.button_index)
