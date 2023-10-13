extends CharacterBody3D


var speed = randi_range(20, 50)

func _physics_process(delta):
	velocity.z = speed
	move_and_slide()
	
	if transform.origin.z > 10:
		queue_free()
