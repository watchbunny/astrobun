extends Area2D
class_name Bullet

var speed: = 800

func _physics_process(delta):
	position += transform.x * speed
	
func _on_bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()



  
