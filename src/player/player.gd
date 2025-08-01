class_name Player
extends CharacterBody2D

const SPEED = 500
const ACCEL = 50

var abilities = {
	"dash": true,
	"special": true
}

var facing: float
var invulnerable: bool = false

signal player_event
signal receive_hit




#var last_direction = 0
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("up"):
		player_event.emit("up")
	if Input.is_action_just_pressed("down"):
		player_event.emit("down")
	if Input.is_action_just_pressed("left"):
		player_event.emit("left")
	if Input.is_action_just_pressed("right"):
		player_event.emit("right")
	if Input.is_action_just_pressed("dash"):
		player_event.emit("dash")
	if Input.is_action_just_pressed("special"):
		player_event.emit("special")
	## the following check is usefull for the "running" state, since it is the
	## exceptional state that checks if multiple keys are NOT pressed
	#var direction = Input.get_axis("left", "right")
	#if direction == 0 and last_direction != 0:
		#player_event.emit("no_left_no_right")
	#elif direction == -1 and last_direction != -1:
		#player_event.emit("left")
	#elif direction == 1 and last_direction != 1:
		#player_event.emit("right")	
	#last_direction = direction



func _physics_process(delta: float) -> void:
	#facing = -velocity.angle_to(Vector2(0,-1)) if velocity.length()!=0 else facing
	#rotation = facing
	move_and_slide()
	pass
