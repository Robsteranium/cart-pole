extends RigidBody3D

@onready var force: Vector3 = Vector3.ZERO
@export var forceMultiplier = 1

func _physics_process(delta):
	force = Vector3.ZERO
	
	if(Input.is_action_pressed("ui_left")):
		force.x = -1
	elif(Input.is_action_pressed("ui_right")):
		force.x = 1
	else:
		force.x = 0
	
	apply_central_force(force * forceMultiplier)
	
func nudge():
	var random_force = Vector3(randf_range(-1,1),0,0)
	apply_central_force(random_force * forceMultiplier)
