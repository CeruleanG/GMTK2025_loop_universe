extends Node

@export var initial_state : State
@export var player_node : CharacterBody2D
@export var animation_player_node : AnimationPlayer
var current_state: State
var states: Dictionary = {}
var pending_context: Dictionary = {}
@onready var debug: Label = $debug

func _ready() -> void:
	for child in get_children():
		if child is State :
			## for every child that is a PlayerState
			states[child.name.to_lower()] = child
			child.player = player_node
			child.animation = animation_player_node
			child.Transition.connect(on_state_transition)
	if initial_state:
		initial_state.enter()
		debug.text = initial_state.name
		current_state = initial_state





func _process(delta: float) -> void:
	current_state.frame_update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)





func on_state_transition(source_state:State, new_state_name:String, context:Dictionary = {}):
	if source_state!=current_state :
		print_debug("State passing as argument is not the current state: source state = " + source_state.name + " current state = " + current_state.name )
		return
		
	var new_state : State = states.get(new_state_name.to_lower())
	if !new_state :
		print_debug("State that is transitioned into does not exist")
		return
		
	if current_state :
		current_state.exit()
	else:
		print_debug("State machine's current state is lost")
	
	debug.text = new_state.name
	new_state.enter(context)
	current_state = new_state
