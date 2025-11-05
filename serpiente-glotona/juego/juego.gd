class_name Juego extends Node

@onready var Cabeza: cabeza = $Cabeza as cabeza
@onready var Limites: limites = %Limites as limites


var time_between_moves:float = 1000.0
var time_since_last_move:float = 0 
var speed:float = 5000.0
var move_dir:Vector2 = Vector2.RIGHT

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_up"):
		move_dir = Vector2.UP
	if Input.is_action_just_pressed("ui_down"):
		move_dir = Vector2.DOWN
	if Input.is_action_just_pressed("ui_left"):
		move_dir = Vector2.LEFT
	if Input.is_action_just_pressed("ui_right"):
		move_dir = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	time_since_last_move += delta * speed
	if time_since_last_move >= time_between_moves:
		update_serpiente()
		time_since_last_move = 0 

func update_serpiente():

	var new_pos:Vector2 = Cabeza.position + move_dir * Global.GRID_SIZE
	new_pos = Limites.wrap_vector(new_pos)
	Cabeza.move_to(new_pos)
	pass
