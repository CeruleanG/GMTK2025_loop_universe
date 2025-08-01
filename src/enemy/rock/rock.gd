extends CharacterBody2D

@export var center_pos: Vector2

var direction_vector : Vector2

const SPEED = 200


func _ready() -> void:
	var random_range = 300.0
	var random_vector = Vector2(randf_range(-random_range,random_range),randf_range(-random_range,random_range))
	
	direction_vector = ((center_pos + random_vector) - global_position).normalized()
	velocity = direction_vector * SPEED

func _physics_process(delta: float) -> void:
	move_and_slide()
