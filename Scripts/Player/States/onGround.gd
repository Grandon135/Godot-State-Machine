extends './Motion.gd'

func update(host, delta):
    .update(host, delta)

    if(!host.body.is_on_floor()):
        #emit_signal("finished", "Jump")
        pass
    else:
        host.velocity.y = 0

func handle_input(host, input : Input):
    if(input.is_action_pressed("jump")):
        #emit_signal("finished", "Jump")
        pass
    pass