extends CharacterBody2D

@export var SPEED = 200.0
@export var Raycast:RayCast2D

var FirstDamaging = false

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("Izquierda","Derecha","Arriba","Abajo")
	if GameManager.PlrMovement:
		velocity = direction * SPEED
		move_and_slide()
		if direction:
			Raycast.position = direction * 5
			Raycast.target_position = direction * 5
			Raycast.force_raycast_update()
	
	
	var HitRay = Raycast.get_collider()
	if not HitRay:
		if not FirstDamaging:
			FirstDamaging = true
		else:
			print(get_tree().root)
			GameManager.Jumpscare()
			
	elif HitRay.name == "ButtonD":
		HitRay.ActivateButton()
	else:
		print(HitRay.name)
		
	if HitRay:
		if HitRay.name == "GoalBlock1":
			GameManager.NextScene()
			FirstDamaging = false
