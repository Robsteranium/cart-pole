extends AIController
class_name AIController3D

# ------------------ Godot RL Agents Logic ------------------------------------#
var _cart: Node3D

func init(cart: Node3D):
	_cart = cart
