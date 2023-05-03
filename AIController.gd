extends AIController3D

@onready var force_x = 0

func get_obs() -> Dictionary:
	return {"obs":[
		_cart.pole.global_rotation.z,
		_cart.pole.angular_velocity.z,
		_cart.position.x,
		_cart.linear_velocity.x
	]}

func get_reward() -> float:
	return _cart.cart_pole.elapsed_time
	
func get_action_space() -> Dictionary:
	return {
		"force_action" : {
			"size": 1,
			"action_type": "continuous"
		}
	}
	
func set_action(action):
	force_x = clamp(action["force_action"][0], -1.0, 1.0)

# -----------------------------------------------------------------------------#

#-- Methods that can be overridden if needed --#

#func get_obs_space() -> Dictionary:
# May need overriding if the obs space is complex
#	var obs = get_obs()
#	return {
#		"obs": {
#			"size": [len(obs["obs"])],
#			"space": "box"
#		},
#	}
