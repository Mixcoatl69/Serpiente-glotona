class_name Spawner extends Node2D

@export var Limites: limites

var escena_comida:PackedScene =  preload("uid://bfukkmtecjm03")

func spawn_comida():
	
	var spawn_point:Vector2 = Vector2.ZERO
	spawn_point.x = randf_range(Limites.x_min +Global.GRID_SIZE, Limites.x_max -Global.GRID_SIZE)
	spawn_point.y = randf_range(Limites.y_min +Global.GRID_SIZE, Limites.y_max -Global.GRID_SIZE)
	
	spawn_point.x = floorf(spawn_point.x / Global.GRID_SIZE) * Global.GRID_SIZE
	spawn_point.y = floorf(spawn_point.y / Global.GRID_SIZE) * Global.GRID_SIZE
	
	var comida = escena_comida.instantiate()
	comida.position = spawn_point
	
	get_parent().add_child(comida)
	pass
