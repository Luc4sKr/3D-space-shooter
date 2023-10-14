extends CharacterBody3D


func _physics_process(delta):
	move_and_slide()

func _on_hitbox_body_entered(body):
	if body.is_in_group("enemies"):
		body.queue_free()
		self.queue_free()
