extends CharacterBody2D
@export var speed = 5.0

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized()
	if velocity == Vector2.ZERO:
		$AnimationPlayer/AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationPlayer/AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationPlayer/AnimationTree.set("parameters/Idle/blend_position", velocity)
		$AnimationPlayer/AnimationTree.set("parameters/Walk/blend_position", velocity)
	move_and_collide(velocity * speed)
	
