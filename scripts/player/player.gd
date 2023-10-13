extends CharacterBody3D


const MAX_SPEED = 30
const ACCELLERATION = 0.75
var inputVector = Vector3()
var speed = Vector3()

func _physics_process(delta):
	inputVector.x = Input.get_action_raw_strength("ui_right") - Input.get_action_raw_strength("ui_left")
	inputVector.y = Input.get_action_raw_strength("ui_up") - Input.get_action_raw_strength("ui_down")
	inputVector = inputVector.normalized()
	
	speed.x = move_toward(speed.x, inputVector.x * MAX_SPEED, ACCELLERATION)
	speed.y = move_toward(speed.y, inputVector.y * MAX_SPEED, ACCELLERATION)
	
	# gira a nave de acordo com a velocidade
	rotation_degrees.z = speed.x * -2
	rotation_degrees.x = speed.y / 2
	rotation_degrees.y = -speed.x / 2
	
	velocity = speed
	move_and_slide()
	
	transform.origin.x = clamp(transform.origin.x, -15, 15)
	transform.origin.y = clamp(transform.origin.y, -10, 10)
