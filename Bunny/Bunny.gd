extends CharacterBody2D
class_name Bunny

@export var speed = 200
@export var jump_height = -400

@onready var sprite = $BunnyIdle

const BULLET = preload("res://Bullet/bullet.tscn")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if Input.is_action_just_pressed("left"):
		sprite.scale.x = abs(sprite.scale.x) * -1
	if Input.is_action_just_pressed("right"):
		sprite.scale.x = abs(sprite.scale.x) * 1
		
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
		
	var horizontal_direction = Input.get_axis("left", "right")
	if horizontal_direction:
		velocity.x = speed * horizontal_direction
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	
	move_and_slide()

func _shoot():
	if Input.is_action_just_pressed("shoot"):
		var bullet = BULLET.instantiate()
	
		get_parent().add_child(bullet)
		bullet.position = position
