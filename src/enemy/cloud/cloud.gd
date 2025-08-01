extends CharacterBody2D

@export var center_pos: Vector2

var direction_vector : Vector2
var moving:= true

const SPEED = 150


func _ready() -> void:
	var random_center_point = random_center_point_gravity(300,500)
	
	direction_vector = (random_center_point - global_position).normalized()
	velocity = direction_vector * SPEED

func _physics_process(delta: float) -> void:
	if moving:
		move_and_slide()

func random_center_point_gravity(min_range: float, max_range) -> Vector2:
	var pos : Vector2
	var random_sign : Array = [-1,1]
	var x : float = random_sign.pick_random() * randf_range(min_range,max_range)
	var y : float = random_sign.pick_random() * randf_range(min_range,max_range)
	return center_pos + Vector2(x,y)
