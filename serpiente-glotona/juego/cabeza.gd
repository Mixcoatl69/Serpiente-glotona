class_name cabeza extends Parte_de_serpiente

signal comida_comida


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Comida"):
		comida_comida.emit()
		area.call_deferred("queue_free")
		
	else:
		pass
