extends Area2D

var bob_height : float = .50
var bob_speed : float = .50

@onready var start_y : float = global_position.y
var t : float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta
	var d = (sin(t * bob_speed) + 1) / 2
	global_position.y = start_y + (d * bob_height)
