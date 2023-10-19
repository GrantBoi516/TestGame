extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		# Move as long as the key/button is pressed.
		position.x += SPEED * delta
	if Input.is_action_pressed("move_left"):
		# Move as long as the key/button is pressed.
		position.x -= SPEED * delta
	if Input.is_action_pressed("move_up"):
		# Move as long as the key/button is pressed.
		position.y -= SPEED * delta
	if Input.is_action_pressed("move_down"):
		# Move as long as the key/button is pressed.
		position.y += SPEED * delta
