extends Timer

export var group="Planet"


func _on_timeout() -> void:
	print("TIMEOUT")
	get_tree().call_group(group, "_on_update")
