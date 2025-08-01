extends State

func enter(context:Dictionary = {}) -> void:
	super()
	player.velocity = Vector2.ZERO
	animation.play("hit")

func exit() -> void:
	super()

func frame_update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func on_animation_finished(anim_name: StringName):
	if anim_name == "hit":
		get_tree().reload_current_scene()

func on_player_event(event: String) :
	pass
