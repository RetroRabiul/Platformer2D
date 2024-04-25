extends CharacterBody2D

var enemy

var speed = 160.0
var attack_speed = 250.0

var target_position = Vector2.ZERO

var attacking = false

#
#@export var enemies_path: Node2D
#@onready var enemies = get_node(enemies_path)
##
#export(NodePath) var player_path
#@onready var player = get_node(player_path)

@export var enemies : Node2D
@export var player : Node2D

func _ready():
	GlobalSignal.ufo_attack.connect(_ufo_attack)
	GlobalSignal.ufo_return.connect(_ufo_return)

func _ufo_attack():
	if attacking:
		return
		
	var all_enemies = enemies.get_children()
	
	if all_enemies.size() > 0 :
		var target_enemy = all_enemies[0]
		
		for check_enemy in all_enemies:
			
			var distance = global_position.distance_to(check_enemy.global_position)
			
			if distance < global_position.distance_to(target_enemy.global_position):
				target_enemy = check_enemy
				
		enemy = target_enemy
		
		if global_position.distance_to(enemy.global_position) < 500:
			attacking = true
	

func _ufo_return():
	attacking = false

func _physics_process(delta):
	pass
	#if attacking:
		#
		#target_position = (enemy.global_position - global_position).normalized()
		#
		#if global_position.distance_to(enemy.global_position) > 2:
			#move_and_slide(target_position * attack_speed, Vector2.UP)
			#
	#else:
		#var player_pos = Vector2(player.global_position.x,player.global_position.y-20)
		#
		#target_position = (player_pos - global_position).normalized()
		#
		#if global_position.distance_to(player_pos) > 80:
			#move_and_slide(target_position * speed, Vector2.UP)
			#
		#
	#
