extends CharacterBody2D

@export var SPEED = 200.0
@export var Raycast:RayCast2D

var Damaging = false

#var TouchedColisionTables = {}


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("Izquierda","Derecha","Arriba","Abajo")
	if GameManager.PlrMovement:
		velocity = direction * SPEED
		move_and_slide()
		if direction:
			Raycast.position = direction
			Raycast.target_position = direction * 5
	
	
	var HitRay = Raycast.get_collider()
	if not HitRay:
		if not Damaging:
			Damaging = true
		else:
			GameManager.PlrMovement = false
	else:
		print("uop")
	
	if HitRay:
		if HitRay.name == "GoalBlock1":
			print("Void")
			GameManager.NextScene()
			Damaging = false
