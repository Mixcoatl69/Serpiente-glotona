class_name Cola extends Parte_de_serpiente

@export var textures:Array[Texture]
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	sprite_2d.texture = textures[0]
	
