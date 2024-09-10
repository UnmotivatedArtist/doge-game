extends Area2D

@export var speed = 400 #The speed of the player in pixles/sec (may change later so it feels right)
var screen_size # Size of the game window

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x +=1
	if Input.is_action_pressed("move_left"):
		velocity.x -=1
	if Input.is_action_pressed("move_up"):
		velocity.y -=1
	if Input.is_action_pressed("move_down"):
		velocity.y +=1
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0
