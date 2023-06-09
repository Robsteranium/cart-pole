extends Node3D

@onready var cart_transform = $Cart.transform
@onready var pole_transform = $Pole.transform
@onready var elapsed_time = 0

func _ready():
	reset()

func reset_node(node, initial_transform):
	node.set_physics_process(false)
	node.transform = initial_transform
	node.angular_velocity = Vector3.ZERO
	node.linear_velocity = Vector3.ZERO
	node.set_physics_process(true)

func reset():
	reset_node($Cart, cart_transform)
	reset_node($Pole, pole_transform)
	$Cart.game_over()
	$Cart.nudge()
	elapsed_time = 0
	
func _physics_process(delta):
	if(Input.is_action_pressed("ui_accept")):
		reset()
	elapsed_time += delta

func _on_area_3d_body_entered(body):
	reset()
