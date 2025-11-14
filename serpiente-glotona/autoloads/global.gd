extends Node


const GRID_SIZE:int = 32

var datos_guardados:DatosGuardados

func _ready():
	datos_guardados = DatosGuardados.load_or_create()
