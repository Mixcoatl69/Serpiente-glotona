class_name limites extends Node2D

@onready var superior_izquierdo: Marker2D = $superior_izquierdo
@onready var inferior_derecho: Marker2D = $inferior_derecho

var x_max:float
var x_min:float
var y_max:float
var y_min:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	x_max = inferior_derecho.position.x
	x_min = superior_izquierdo.position.x
	y_max = inferior_derecho.position.y
	y_min = superior_izquierdo.position.y 

func wrap_vector(v:Vector2) -> Vector2:
	if v.x > x_max:
		return Vector2(x_min,v.y)
	elif v.x < x_min:
		return Vector2(x_max,v.y)
	elif v.y > y_max:
		return Vector2(v.x,y_min)
	elif v.y < y_min:
		return Vector2(v.x,y_max)
	return v 
