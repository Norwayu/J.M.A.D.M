extends CharacterBody2D

@export var SPEED = 200.0
@export var Raycast:RayCast2D

#var TouchedColisionTables = {}


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("Izquierda","Derecha","Arriba","Abajo")
	velocity = direction * SPEED
	move_and_slide()
	
	Raycast.target_position = direction
	
	var HitRay = Raycast.get_collider()
	
	if not HitRay:
		pass
		#print("NOO")
	else:
		pass
		#print(HitRay.name)
	
	if HitRay:
		if HitRay.name == "GoalBlock1":
			print("Void")
			GameManager.NextScene()
