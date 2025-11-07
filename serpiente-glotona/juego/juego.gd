class_name Juego extends Node

@onready var Cabeza: cabeza = $Cabeza as cabeza
@onready var Limites: limites = %Limites as limites
@onready var spawner: Spawner = $Spawner as Spawner 


var time_between_moves:float = 1000.0
var time_since_last_move:float = 0 
var speed:float = 5000.0
var move_dir:Vector2 = Vector2.RIGHT
var parte_de_serpiente:Array[Parte_de_serpiente] = []

func _ready() -> void:
	Cabeza.comida_comida.connect(_on_comida_comida)
	Cabeza.collided_with_cola.connect(_on_cola_collided)
	spawner.cola_added.connect(_on_cola_added)
	spawner.spawn_comida()
	parte_de_serpiente.push_back(Cabeza)


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
	
	for i in range(1,parte_de_serpiente.size(),1):
		parte_de_serpiente[i].move_to(parte_de_serpiente[i-1].last_position)

func _on_comida_comida():
	print("la comida fue comida")
	spawner.call_deferred("spawn_comida")
	spawner.call_deferred("spawn_cola",parte_de_serpiente[parte_de_serpiente.size()-1].last_position)
	speed += 500.0
	
func _on_cola_added(cola:Cola):
	parte_de_serpiente.push_back(cola)

func _on_cola_collided():
	print("Has muerto")
