extends CharacterBody2D

var move_speed : float = 100.0
var jump_force : float = 250.0
var gravity : float = 500.0

var score : int = 0

@onready var score_text : Label = get_node("CanvasLayer/ScoreLabel")

func _ready():
	GlobalSignal.show_sign.connect(_show_sign)
	GlobalSignal.hide_sign.connect(_hide_sign)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	velocity.x = 0
	
	if Input.is_key_pressed(KEY_A):
		velocity.x -= move_speed
		
	if Input.is_key_pressed(KEY_D):
		velocity.x += move_speed
		
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y -= jump_force
	
	move_and_slide()
	
	if global_position.y > 600:
		game_over()

func  game_over():
	call_deferred("reload")

func reload():
	get_tree().reload_current_scene()

func _show_sign(sign_text):
	$CanvasLayer/SignText.text += sign_text
	$CanvasLayer/SignText.visible = true
	

func _hide_sign():
	$CanvasLayer/SignText.visible = false
	


func add_score (amount):
	score += amount
	score_text.text = str("Score : ", score)
