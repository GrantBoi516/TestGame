extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
	
func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		# Move as long as the key/button is pressed.
		position.x += SPEED * delta
		#moves right
	if Input.is_action_pressed("move_left"):
		# Move as long as the key/button is pressed.
		position.x -= SPEED * delta
		#moves left
	if Input.is_action_pressed("move_up"):
		# Move as long as the key/button is pressed.
		position.y -= SPEED * delta
		#moves up
	if Input.is_action_pressed("move_down"):
		# Move as long as the key/button is pressed.
		position.y += SPEED * delta
		#moves down
		
