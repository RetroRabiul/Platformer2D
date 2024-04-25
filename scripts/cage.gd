extends StaticBody2D

var haveKey = false
var gate_locked = true

#@onready var opening = $Area2D/Cage
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignal.got_key.connect(_get_cage_key)
	$Area2D/Cage.play("locked")
	
func _get_cage_key():
	haveKey = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		if haveKey and gate_locked :
			_opening()
			$Area2D/Cage.play("open")
			gate_locked = false
			$CageClosed.set_deferred("disabled", true)
			print("frame" + str($Area2D/Cage.frame))
		

func _opening():
	print("frame" + str($Area2D/Cage.frame))
	if $Area2D/Cage.frame == 25:
		$Area2D/Cage.stop("open")
		print("frame" + str($Area2D/Cage.frame))
