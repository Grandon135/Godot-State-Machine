extends './onGround.gd'

func enter(host : StateMachine):
	#Set Animated Sprite
	pass

func update(host: StateMachine, delta):
	.update(host, delta)
	#print(host._current_state.name)
	host.velocity = Vector2.ZERO
	
	if(axis_input.x != 0):
		emit_signal("finished", "Run")
		print("State Change to Run")
	
	.update(host, delta)

func handle_input(host: StateMachine, input : Input):
	.handle_input(host, input)

func exit(host: StateMachine):
	pass
