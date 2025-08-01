extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect.visible = true
	set_transparency(0.0)
	set_color(0,0,0)


func set_transparency (value: float):
	color_rect.modulate.a = value

func set_color (r_val: float, g_val: float, b_val: float):
	color_rect.modulate.r = r_val
	color_rect.modulate.g = g_val
	color_rect.modulate.b = b_val
