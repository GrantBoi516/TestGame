extends CharacterBody2D



@export var skeleHP = 10
@export var speed = .5
@export var follow_range = 200
var player_position
var target_position
var tmp = 1
var random = RandomNumberGenerator.new()
@onready var player = get_parent().get_node("/root/level/CharacterBody2D")
@onready var attack = $SkeleAttack
@onready var coin = load("res://Items/coin.tscn")
@onready var heart = load("res://Items/heart.tscn")
@onready var SP = get_parent().get_node("HUD/SP")
@onready var stop = Vector2.ZERO
@onready var anim = $SkeleAnim/AnimationTree




func _physics_process(_delta):
	if position.distance_to(player.position) < follow_range:
		follow()




func _processAnim(delta):
	animation(target_position)



func get_hit(damage):
	skeleHP -= damage
	print("enemy was hit, HP:" + str(skeleHP))
	if skeleHP <= 0:
		SP.plus_SP()
		SP.plus_SP()
		coin_drop()
		heart_drop()
		queue_free()
	knockback()

func knockback():
	var knockback_position = -(player_position - position).normalized() * 80
	target_position = knockback_position
	move_and_collide(target_position)





func follow():
	if player.HP <= 0:
		target_position = stop
	if player.HP >= 69:
		target_position = stop
	else:
		player_position = player.position
		target_position = (player_position - position).normalized()
	move_and_collide(target_position * speed)





func animation(tp):
	if position.distance_to(player.position) > follow_range:
		anim.get("parameters/playback").travel("Idle")
		return
	else:
		if tp == Vector2.ZERO:
			anim.get("parameters/playback").travel("Idle")
		else:
			anim.get("parameters/playback").travel("Walk")
			anim.set("parameters/Idle/blend_position", tp)
			anim.set("parameters/Walk/blend_position", tp)
	if position.distance_to(player.position) < 30:
		anim.get("parameters/playback").travel("Idle")
		return





func coin_drop():
	while tmp <= 1:
		random.randomize()
		var x = random.randi_range(-10, 10)
		var y = random.randi_range(-10, 10)
		var instancedCoin = coin.instantiate()
		get_parent().call_deferred("add_child", instancedCoin)
		instancedCoin.position.y = position.y + y
		instancedCoin.position.x = position.x + x
		tmp += 1
	tmp = 1

func heart_drop():
	while tmp <= 1:
		random.randomize()
		var x = random.randi_range(-10, 10)
		var y = random.randi_range(-10, 10)
		var instancedHeart =heart.instantiate()
		get_parent().call_deferred("add_child", instancedHeart)
		instancedHeart.position.y = position.y + y
		instancedHeart.position.x = position.x + x
		tmp += 1
	tmp = 1
