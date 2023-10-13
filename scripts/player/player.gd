extends CharacterBody3D
 
@onready var guns = [$gun_0, $gun_1]
var bullet_scene = preload("res://scenes/bullet.tscn")
@onready var main = get_tree().current_scene

const MAX_SPEED = 30
const ACCELLERATION = 0.75
var inputVector = Vector3()

func _physics_process(delta):
	inputVector.x = Input.get_action_raw_strength("ui_right") - Input.get_action_raw_strength("ui_left")
	inputVector.y = Input.get_action_raw_strength("ui_up") - Input.get_action_raw_strength("ui_down")
	inputVector = inputVector.normalized()
	
	velocity.x = move_toward(velocity.x, inputVector.x * MAX_SPEED, ACCELLERATION)
	velocity.y = move_toward(velocity.y, inputVector.y * MAX_SPEED, ACCELLERATION)
	
	# gira a nave de acordo com a velocidade
	rotation_degrees.z = velocity.x * -2
	rotation_degrees.x = velocity.y / 2
	rotation_degrees.y = -velocity.x / 2
	
	move_and_slide()
	
	transform.origin.x = clamp(transform.origin.x, -15, 15)
	transform.origin.y = clamp(transform.origin.y, -10, 10)
	
	for gun in guns:
		gun.transform = self.transform
	
	shoot()
	
func shoot():
	print(guns[0].position)
	if Input.is_action_just_pressed("ui_accept"):
		for gun in guns:
			var bullet = bullet_scene.instantiate()
			main.add_child(bullet)
			bullet.transform = gun.transform
			bullet.velocity = bullet.transform.basis.z * -10
