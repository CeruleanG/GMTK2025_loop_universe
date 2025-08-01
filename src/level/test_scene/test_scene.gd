extends Node

@export var rock_scene: PackedScene
@export var gravity_scene: PackedScene
@export var cloud_scene: PackedScene

@onready var spawn_markers: Node2D = $spawn_markers

var spawn_points_array: Array
var center_pos = Vector2(550,360)
var timer : float = 0

func _ready() -> void:
	spawn_points_array = spawn_markers.get_all_markers()

func _process(delta: float) -> void:
	timer -= delta
	if timer <= 0:
		timer = 1
		spawn_type(["rock","gravity","cloud"].pick_random())
		#spawn_type("gravity")




func spawn_type(type_name: String):
	var obj
	match type_name:
		"rock":
			obj = rock_scene.instantiate()
		"gravity":
			obj = gravity_scene.instantiate()
		"cloud":
			obj = cloud_scene.instantiate()
		
	obj.center_pos = center_pos
	obj.global_position = spawn_points_array.pick_random().global_position
	add_child(obj)
