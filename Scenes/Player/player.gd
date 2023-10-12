extends CharacterBody2D

@export var speed: int = 35
@onready var sprite = $AnimatedSprite2D

func _physics_process(_delta):
	controller()
	spriteAnimation()
	move_and_slide()

func controller():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed
	
func spriteAnimation():
	if velocity.length() == 0:
		sprite.stop()
	else:
		var playAnimation = "down"
		if velocity.x < 0: # negative value going left
			playAnimation = "left"
		elif velocity.x > 0:
			playAnimation = "right"
		elif velocity.y < 0: # negative value for y axis is going top
			playAnimation = "up"
		
		sprite.play("walk_" + playAnimation)

