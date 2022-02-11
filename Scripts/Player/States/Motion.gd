extends State

var axis_input: Vector2

func enter(host):
    .enter(host)

func update(_host, _delta):
    axis_input = get_input_axis()

func get_input_axis():
    var axis = Vector2.ZERO
    axis.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    axis.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
    return axis