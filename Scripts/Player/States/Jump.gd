extends './inAir.gd'

export (float) var gravity = 30
export (float) var jump_power = -100

func enter(host):
	pass

func update(host, delta):
	host.velocity.y += gravity * delta

	if(host.body.is_on_floor()):
		emit_signal("finished", "Run")
		print("Change State to Run")

	host.body.move_and_slide(host.velocity, Vector2.UP)

func handle_input(host, input: Input):
	if(input.is_action_just_pressed("jump")):
		host.velocity.y = jump_power
	
func exit(host):
	pass
	
