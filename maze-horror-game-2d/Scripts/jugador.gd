extends CharacterBody2D

@export var SPEED = 200.0
@export var Raycast:RayCast2D
@export var RayDistance = 8
@export var PivotRotating:Node2D

var FirstDamaging = false
var Orbit = 0

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("Izquierda","Derecha","Arriba","Abajo")
	if GameManager.PlrMovement:
		velocity = direction * SPEED
		move_and_slide()
	
	Raycast.target_position = Vector2(RayDistance,0)
	PivotRotating.rotate(1)
	Raycast.force_raycast_update()

	var HitRay = Raycast.get_collider()
	if not HitRay:
		if not FirstDamaging:
			FirstDamaging = true
		else:
			pass
			GameManager.Jumpscare()
	elif HitRay.name == "ButtonD":
		HitRay.ActivateButton()
		
	if HitRay:
		if HitRay.name == "GoalBlock1":
			GameManager.NextScene()
			FirstDamaging = false
			
