extends Node
class_name StateMachine

export(String) var default_state = 'Idle'
export(NodePath) var kinematic_body_path
export(NodePath) var animated_sprite_path

var velocity = Vector2.ZERO
var _state_stack = []
var _current_state setget set_current_state, get_current_state
var _state_map = {}

var has_up_been_called = false
onready var body = get_node(kinematic_body_path)
onready var animated_sprite = get_node(animated_sprite_path)

func _ready():
	var children_nodes = get_children()

	#initialize the state map
	for child in children_nodes:
		if(child is State):
			add_state_to_map(child)
		else:
			push_error("StateMachine child " + child.name + " is not a state.")
		
		_state_stack.push_front(_state_map[default_state])
		#_current_state = _state_stack[0]
		change_state(default_state)

func add_state_to_map(state : State):
	if(_state_map.has(state.name) == false):
		_state_map[state.name] = get_node(state.name)
		if(state.connect("finished", self, "change_state") == null):
			push_error(self.name + " failed to connect to state finnished")
		return true
	else:
		push_error("State already exists in state stack for " + state.name)
		return false

func _physics_process(delta: float):
	_handle_input(Input)
	_current_state.update(self, delta)

func _handle_input(input: Input):
	_current_state.handle_input(self, input)

func change_state(name: String):
	if(_state_map.has(name)):
		if(_current_state != null):
			_current_state.exit(self)
		
		_current_state = _state_map[name]
		_current_state.enter(name)
	else:
		push_error("StateMachine does not contain state " + name)


# Setters/Getters
func set_current_state(state: String):
	change_state(state)

func get_current_state():
	return _current_state
