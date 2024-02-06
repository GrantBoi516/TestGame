extends CharacterBody2D

@export var additionalATK = 1
@export var lvl = 1
@export var lvl_price = 10
@export var speed = 1.5
@export var HP = 4
@export var max_HP = 4
@export var coins = 0
@export var weapon_val = "none"
@export var can_move = true
@export var three_swing = 0
var fireball = load("res://Player/player_fireball.tscn")
var active_abilitys = ["burningtouch"]
@onready var anim = $PlayerAnim/AnimTree
@onready var sword = $sword
@onready var axe = $axe
@onready var rapier = $rapier
@onready var none = $none
@onready var weapon = none
@onready var crossbow = $crossbow
@onready var HUD = get_parent().get_node("HUD")
@onready var CoinBox = HUD.get_node("LVLBOX")

func _physics_process(_delta):
	movement(velocity)


func _processCrossBow(_delta):
	while weapon_val == "crossbow":
		sword.get_node("hitbox").disabled = true
		axe.get_node("hitbox").disabled =true
		rapier.get_node("hitbox").disabled =true
		crossbow.get_node("hitbox").disabled = false
func _processRapier(_delta):
	while weapon_val == "rapier":
		sword.get_node("hitbox").disabled = true
		axe.get_node("hitbox").disabled =true
		crossbow.get_node("hitbox").disabled = true
		rapier.get_node("hitbox").disabled =false
func _processAxe(_delta):
	while weapon_val == "axe":
		sword.get_node("hitbox").disabled = true
		rapier.get_node("hitbox").disabled =true
		crossbow.get_node("hitbox").disabled = true
		axe.get_node("hitbox").disabled = false
func _processSword(_delta):
	while weapon_val == "sword":
		axe.get_node("hitbox").disabled = true
		rapier.get_node("hitbox").disabled =true
		crossbow.get_node("hitbox").disabled = true
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
func crossbow_change():
	weapon = crossbow
	weapon_val = "crossbow"




func movement(v):
	if can_move == true:
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
	if event.is_action_pressed("click") && weapon_val != "rapier" && can_move != false:
		weapon.attack()
		three_swing += 1
		if three_swing == 4 && active_abilitys.find("willowisp") > -1:
			make_fireball()
	elif event.is_action_pressed("click") && $rapierCooldown.is_stopped() == true && can_move != false:
		$rapierCooldown.start()
		weapon.attack(event)



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
	if_then_lvl_up()
	CoinBox.coin_collect()

func get_heart():
	print("got heart")

func if_then_lvl_up():
	if coins >= lvl_price:
		coins = coins - lvl_price
		lvl_price = lvl_price + 5
		print("leveled up!")
		additionalATK = additionalATK * 1.05
		var lvlscreen = load("res://Menus/level_up_menu.tscn").instantiate()
		get_parent().get_node("HUD").add_child(lvlscreen)
		can_move = false
		get_node("hitbox").disabled = true
		get_node("Sprite2D").hide()
		weapon.get_node("hitbox").disabled = true
func blast_dmg(pos):
	var z = 0
	if active_abilitys.find("blastdamage") > -1:
		while z < 4:
			var InstancedFireball = fireball.instantiate()
			var direction = Vector2.ZERO
			get_tree().current_scene.add_child.call_deferred(InstancedFireball)
			InstancedFireball.position = pos
			if z == 0:
				direction = Vector2.UP
			if z == 1:
				direction = Vector2.DOWN
			if z == 2:
				direction = Vector2.LEFT
			if z == 3:
				direction = Vector2.RIGHT
			InstancedFireball.rotation = direction.angle()
			z += 1
func make_fireball():
	var InstancedFireball = fireball.instantiate()
	get_tree().current_scene.add_child.call_deferred(InstancedFireball)
	InstancedFireball.position = position
	var direction = self.global_position.direction_to(get_global_mouse_position())
	InstancedFireball.rotation = direction.angle()
	three_swing = 0
func cynderingrage_lvlup():
	additionalATK = additionalATK * 1.2
