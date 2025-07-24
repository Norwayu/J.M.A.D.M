extends Node2D

var Block:Node2D
@export var Activated:bool
@export var BlockType:String
@export var TargetBlock:StaticBody2D
@export var SoundGet:AudioStreamPlayer2D

func _ready() -> void:
	if Block and not BlockType:
		if Block.name == "BlockDoor":
			BlockType = "BlockDoor"

func  _physics_process(delta: float) -> void:
	if BlockType == "BlockDoor" and TargetBlock:
		var Sprite = get_node("MainSprite")
		if Activated:
			#El Boton Cambia A Su Forma Apretada Cuando Si Esta Apretado
			if Sprite: 
				Sprite.modulate = Color(0.137, 0.296, 0.331, 1)
				
			TargetBlock.modulate = Color(0,0,0,0.1)
			TargetBlock.collision_layer = 2
		else:
			TargetBlock.modulate = Color(0.05, 0.216, 0.193)
			TargetBlock.collision_layer = 1
			#El Boton Cambia A Su Forma Normal Cuando No Esta Apretado
			if Sprite:
				Sprite.modulate = Color(0.379, 0.804, 0.893, 1)
			
func ActivateButton() -> void:
	if BlockType == "BlockDoor" and Activated == false: 
		Activated = true
		SoundGet.play()
