extends Sprite2D

var player: Player


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if player:
		var direction = (global_position - player.global_position).normalized()
		
		player.velocity.x = lerp(player.velocity.x,direction.x * player.SPEED * 1.5, player.ACCEL / 5 * delta)
		player.velocity.y = lerp(player.velocity.y,direction.y * player.SPEED * 1.5, player.ACCEL / 5 * delta)
		#if player.velocity.length() >= player.SPEED:
			#player.velocity = player.velocity.normalized() * player.SPEED
		#player.move_and_slide()


func _on_field_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body


func _on_field_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null
