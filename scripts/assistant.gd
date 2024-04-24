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
@onready var enemies_path : Node2D = get_node("CanvasLayer/ScoreLabel")

func _ready():
	pass

func _physics_process(delta):
	pass
