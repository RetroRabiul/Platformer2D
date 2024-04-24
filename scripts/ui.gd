extends Control

var score : int = 0

@onready var score_text : Label = get_node("CanvasLayer/ScoreLabel")


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignal.show_sign.connect(_show_sign)
	GlobalSignal.hide_sign.connect(_hide_sign)


func _show_sign(sign_text):
	$SignText.text += sign_text
	$SignText.visible = true
	

func _hide_sign():
	$SignText.visible = false
	


func add_score (amount):
	score += amount
	score_text.text = str("Score : ", score)
