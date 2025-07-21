extends Node2D
@export var ColisionAdjust:CollisionShape2D
@export var GetAdjuster:Node2D

func _ready() -> void:
	print(scale)
	#ColisionAdjust.scale = GetAdjuster.scale
	
