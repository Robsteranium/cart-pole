extends RigidBody3D

@onready var ai_controller = $AIController3D
@onready var pole = $"../Pole"
@onready var cart_pole = $"../../CartPole"

@onready var force: Vector3 = Vector3.ZERO
@export var force_multiplier = 30

func _ready():
	ai_controller.init(self)

func game_over():
	ai_controller.done = true
	ai_controller.needs_reset = true

func _physics_process(delta):
	if ai_controller.needs_reset:
		ai_controller.reset()
		return
	
	force = Vector3.ZERO
	
	if ai_controller.heuristic == "human":
		if(Input.is_action_pressed("ui_left")):
			force.x = -1
		elif(Input.is_action_pressed("ui_right")):
			force.x = 1
		else:
			force.x = 0
	else:
		force.x = ai_controller.force_x
	
	apply_central_force(force * force_multiplier)
	
func nudge():
	var random_force = Vector3(randf_range(-1,1),0,0)
	apply_central_force(random_force * force_multiplier / 2)
