extends CharacterBody2D



@export var speed = 1.5
@export var HP = 4
@export var max_HP = 4
@export var coins = 0
@export var weapon_val = "none"
@onready var anim = $PlayerAnim/AnimTree
@onready var sword = $sword
@onready var axe = $axe
@onready var rapier = $rapier
@onready var none = $none
@onready var weapon = none




func _physics_process(_delta):
	movement(velocity)



func _processHUD(_delta):
	get_parent().get_node("HUD/CC/Label").text = "coins:" + str(coins)
	get_parent().get_node("HUD/W/Label").text = "weapon:" + str(weapon_val)






func _processRapier(_delta):
	while weapon_val == "rapier":
		sword.get_node("hitbox").disabled = true
		axe.get_node("hitbox").disabled =true
		rapier.get_node("hitbox").disabled =false
func _processAxe(_delta):
	while weapon_val == "axe":
		sword.get_node("hitbox").disabled = true
		rapier.get_node("hitbox").disabled =true
		axe.get_node("hitbox").disabled = false
func _processSword(_delta):
	while weapon_val == "sword":
		axe.get_node("hitbox").disabled = true
		rapier.get_node("hitbox").disabled =true
		sword.get_node("hitbox").disabled = false

func rapier_change():
	weapon = rapier
	weapon_val = "rapier"
func axe_change():
	weapon = axe
	weapon_val = "axe"
func sword_change():
	weapon = sword
	weapon_val = "sword"





func movement(v):
	if Input.is_action_pressed("god"):
		HP = 100
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
		anim.get("parameters/playback").travel("Idle")
	else:
		anim.get("parameters/playback").travel("Walk")
		anim.set("parameters/Idle/blend_position", v)
		anim.set("parameters/Walk/blend_position", v)
	move_and_collide(v * speed)
	return v





func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("click"):
		weapon.attack()

func player_hit(damage):
	HP -= damage
	print("player was hit, HP:" + str(HP))

func die():
	var deathscreen = load("res://Menus/death_menu.tscn").instantiate()
	get_parent().add_child(deathscreen)
	$Sprite2D.hide()
	get_node("hitbox").disabled = true
	weapon.get_node("Sprite2D").hide()
	weapon.get_node("hitbox").disabled = true





func get_coin():
	coins += 1
	print("got coin")

func get_heart():
	HP += 1
	print("got heart")



