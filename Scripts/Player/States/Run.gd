extends './onGround.gd'

export(float) var run_speed = 125
export(float) var walk_friction = 0.8
export(float) var idle_threshold = 0.1


func enter(host : StateMachine):
	.enter(host)
	pass

func update(host: StateMachine, delta):
	.update(host, delta)
	print(host._current_state.name)
	if(axis_input.x > 0):
		host.velocity.x = run_speed
		#animate sprite flip	
	elif(axis_input.x < 0):
		host.velocity.x = -run_speed
		#animate sprite flip
	else:
		host.velocity.x = lerp(host.velocity.x, 0, walk_friction)

	var collision = host.body.move_and_slide_with_snap(host.velocity, Vector2.DOWN, Vector2.UP)
	if(abs(host.velocity.x) < idle_threshold):
		emit_signal("finished", "Idle")

func handle_input(host: StateMachine, input : Input):
	.handle_input(host, input)

func exit(host: StateMachine):
	pass
