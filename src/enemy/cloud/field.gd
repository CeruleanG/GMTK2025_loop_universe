extends Sprite2D

var player: Player
var timer: float = 0
var val: float = 0.0

const MAX_DARKNESS = 0.9

func _ready() -> void:
	timer = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		if val < MAX_DARKNESS:
			val = move_toward(val, 1.0,  delta)
			UIhandler.fade.set_transparency(val)
	else:
		if val > 0 :
			val = move_toward(val, 0.0,  delta * 3)
			UIhandler.fade.set_transparency(val)


func _on_field_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body


func _on_field_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null
