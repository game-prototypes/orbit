tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("DonutCollider2D", "Area2D", preload("donut_collider_2d.gd"), preload("donut_collider_2d_icon.svg"))


func _exit_tree():
	remove_custom_type("DonutCollider2D")
