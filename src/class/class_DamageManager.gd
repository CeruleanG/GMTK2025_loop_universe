class_name DamageManager extends Node

@export var player: CharacterBody2D


func _ready() -> void: 
	for child in player.get_children():
		if child is Sprite2D :
			for grandchild in child.get_children():
				if grandchild is HurtBox:
					## grandchild = each node under the path "$body/Sprite" that is a Hurtbox
					grandchild.area_entered.connect(_on_hurtbox_area_entered)


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Danger") and !player.invulnerable:
		## if an enemy hits a player, and the player is not invulnerable
		var target_area = area as HitBox # casting to retrieve the damage value
		player.receive_hit.emit()
