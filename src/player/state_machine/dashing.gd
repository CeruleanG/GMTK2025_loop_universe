extends State

var dash_direction: Vector2
@onready var dash_timer: Timer = $dash_timer


func enter(context:Dictionary = {}) -> void:
	super()
	dash_direction.x = sign(Input.get_axis("left", "right"))
	dash_direction.y = sign(Input.get_axis("up", "down"))
	dash_direction = dash_direction.normalized()
	dash_timer.start()

func exit() -> void:
	super()
	dash_timer.stop()
	player.velocity.x = clamp(player.velocity.x, -player.SPEED, player.SPEED)
	player.velocity.y = clamp(player.velocity.y, -player.SPEED, player.SPEED)

func frame_update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	player.velocity.x = lerp(player.velocity.x,dash_direction.x * player.SPEED * 3, player.ACCEL * delta * 2)
	player.velocity.y = lerp(player.velocity.y,dash_direction.y * player.SPEED * 3, player.ACCEL * delta * 2)

	
	#player.move_and_slide()

func on_animation_finished(anim_name: StringName):
	pass

func on_player_event(event: String) :
	pass


func _on_dash_timer_timeout() -> void:
	Transition.emit(self,"moving")
