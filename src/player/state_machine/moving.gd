extends State


func enter(context:Dictionary = {}) -> void:
	super()

func exit() -> void:
	super()

func frame_update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var direction : Vector2
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	direction = direction.normalized()

	player.velocity.x = lerp(player.velocity.x,direction.x * player.SPEED, player.ACCEL * delta)
	player.velocity.y = lerp(player.velocity.y,direction.y * player.SPEED, player.ACCEL * delta)
	
	#player.move_and_slide()	

func on_animation_finished(anim_name: StringName):
	pass

func on_player_event(event: String) :
	match event:
		"dash":
			if player.abilities["dash"] :
				Transition.emit(self,"dashing")
		_:
			pass
