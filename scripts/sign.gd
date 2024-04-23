extends Area2D

@export var sign_text = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print(sign_text)
		GlobalSignal.emit_signal("show_sign", sign_text)


func _on_body_exited(body):
	if body.is_in_group("Player"):
		GlobalSignal.emit_signal("hide_sign")

