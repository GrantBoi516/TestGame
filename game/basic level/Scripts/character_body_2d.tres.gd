extends CharacterBody2D


@export var speed = 3.0
@onready var weapon = $weapon
@export var HP = 4
@export var coins = 0
func _physics_process(delta):
	movement(velocity)#calls movement




func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):#attack action
		weapon.attack()

func movement(v):#player inputs for movement
	if Input.is_action_pressed("d"):
		v.x += 1
	if Input.is_action_pressed("a"):
		v.x -= 1
	if Input.is_action_pressed("s"):
		v.y += 1
	if Input.is_action_pressed("w"):
		v.y -= 1
	v = v.normalized()
	if v == Vector2.ZERO:
		$PlayerAnim/AnimTree.get("parameters/playback").travel("Idle")
	else:
		$PlayerAnim/AnimTree.get("parameters/playback").travel("Walk")
		$PlayerAnim/AnimTree.set("parameters/Idle/blend_position", v)
		$PlayerAnim/AnimTree.set("parameters/Walk/blend_position", v)
	move_and_collide(v * speed)
	return v
func player_hit(damage):#handles getting hit
	HP -= damage
	print("player was hit, HP:" + str(HP))
func die():
	#overlay death screen
	$Sprite2D.hide()
	get_node("hitbox").disabled = true
	weapon.get_node("Sprite2D").hide()#change to turn guy to ghost maybe
	weapon.get_node("hitbox").disabled = true
func get_coin():
	coins = coins + 1
	print("coin collected")
