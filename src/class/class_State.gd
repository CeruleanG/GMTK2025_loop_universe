class_name State
extends Node

signal Transition
var animation : AnimationPlayer
var player: CharacterBody2D

func enter(context:Dictionary = {}) -> void:
	animation.animation_finished.connect(on_animation_finished)
	player.player_event.connect(on_player_event)
	player.receive_hit.connect(on_hit)

func exit() -> void:
	animation.animation_finished.disconnect(on_animation_finished)
	player.player_event.disconnect(on_player_event)	
	player.receive_hit.disconnect(on_hit)

func frame_update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func on_animation_finished(anim_name: StringName):
	pass

func on_player_event(event: String) :
	pass

func on_hit ():
	Transition.emit(self,"hit")
