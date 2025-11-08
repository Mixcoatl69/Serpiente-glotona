class_name HasMuerto extends CanvasLayer

@onready var puntuación_label: Label = %PuntuaciónLabel
@onready var puntuaciónmaxima_label: Label = %PuntuaciónmaximaLabel
@onready var reinicio_boton: Button = %ReinicioBoton
@onready var salir_boton: Button = %SalirBoton

func set_puntuacion(n:int):
	puntuación_label.text = "Puntuación final: " + str(n)

func _on_reinicio_boton_pressed() -> void:
	get_tree().reload_current_scene()


func _on_salir_boton_pressed() -> void:
	get_tree().quit()

func _notification(what):
	match what:
		NOTIFICATION_ENTER_TREE:
			get_tree().paused = true 
		NOTIFICATION_EXIT_TREE:
			get_tree().paused = false
