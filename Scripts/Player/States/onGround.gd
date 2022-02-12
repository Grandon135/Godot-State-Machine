extends './Motion.gd'

func update(host, delta):
	.update(host, delta)
	
	
	if(!host.body.is_on_floor()):
		print("State Changed to Jump State")
		emit_signal("finished", "Jump")
		#pass
	else:
		host.velocity.y = 0

func handle_input(host, input : Input):
	if(input.is_action_pressed("jump")):
		print("State Changed to Jump State")
		emit_signal("finished", "Jump")
		pass
	pass
