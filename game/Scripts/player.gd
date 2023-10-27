extends CharacterBody2D
@export var speed = 5.0
func _ready():
	var velocity = Vector2.ZERO
	var character = 1
	var weapon = 1
	var health = 100
	var strenth = .0


func _physics_process(delta):
	movement(velocity)
func _process(delta):
	attack():



func movement(v):
	if Input.is_action_pressed("ui_right"):
		v.x += 1
	if Input.is_action_pressed("ui_left"):
		v.x -= 1
	if Input.is_action_pressed("ui_down"):
		v.y += 1
	if Input.is_action_pressed("ui_up"):
		v.y -= 1
	v = v.normalized()
	if v == Vector2.ZERO:
		$AnimationPlayer/AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationPlayer/AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationPlayer/AnimationTree.set("parameters/Idle/blend_position", v)
		$AnimationPlayer/AnimationTree.set("parameters/Walk/blend_position", v)
	move_and_collide(v * speed)
	return v
func attack():
	if.Input.
