class_name Juego extends Node

var move_dir:Vector2 = Vector2.RIGHT

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_up"):
		move_dir = Vector2.UP
	if Input.is_action_just_pressed("ui_down"):
		move_dir = Vector2.DOWN
	if Input.is_action_just_pressed("ui_left"):
		move_dir = Vector2.LEFT
	if Input.is_action_just_pressed("ui_right"):
		move_dir = Vector2.RIGHT
