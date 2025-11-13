class_name MenuPausa extends CanvasLayer

@onready var reiniciar: Button = %Reiniciar
@onready var salir: Button = %Salir
@onready var resumir: Button = %Resumir




func _on_reiniciar_pressed() -> void:
	get_tree().reload_current_scene()



func _on_salir_pressed() -> void:
	get_tree().quit()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		queue_free()

func _on_resumir_button_down() -> void:
	queue_free()

func _notification(what):
	match what:
		NOTIFICATION_ENTER_TREE:
			get_tree().paused = true 
		NOTIFICATION_EXIT_TREE:
			get_tree().paused = false
