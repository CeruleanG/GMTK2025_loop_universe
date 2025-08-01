extends Node2D


func get_all_markers () -> Array:
	var val: Array = []
	for child in get_children():
		if child is Marker2D:
			val.append(child)
	return val
