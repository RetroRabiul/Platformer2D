extends StaticBody2D

var haveKey = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignal.gotkey.connect(GotCageKey)
	
func GotCageKey():
	haveKey = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		if haveKey :
			$Area2D/Cage.frame += 1
			print("frame")
