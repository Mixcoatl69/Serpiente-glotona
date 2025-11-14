class_name DatosGuardados extends Resource

@export var puntuacion_maxima:int = 0

const SAVE_PATH:String = "user://puntuaciones_maximas.tres"

func save() -> void:
	ResourceSaver.save(self, SAVE_PATH)

static func load_or_create() -> DatosGuardados:
	var res:DatosGuardados
	if FileAccess.file_exists(SAVE_PATH):
		res = load(SAVE_PATH) as DatosGuardados
	else:
		res = DatosGuardados.new()
	return res
