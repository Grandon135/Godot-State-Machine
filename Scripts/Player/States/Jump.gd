extends './inAir.gd'

func enter(host : StateMachine):
    #Set Animated Sprite
    pass

func update(host: StateMachine, delta):
	.update(host, delta)
	print(host._current_state.name)

	if(host.body.is_on_floor() && host.velocity == Vector2.ZERO):
		emit_signal("finished", "Idle")
	elif(host.body.is_on_floor()):
		emit_signal("finished", "Run")
	else:
		#apply Gravity
		pass

func handle_input(host: StateMachine, input : Input):
    .handle_input(host, input)

func exit(host: StateMachine):
    pass
