extends CharacterBody2D


@export var skeleHP = 2
@export var speed = 1
var player_position
var target_position
@onready var player = get_parent().get_node("CharacterBody2D")
@onready var attack = $SkeleAttack

func _physics_process(delta):
	if position.distance_to(player.position) < 200:
		follow()
	animation(target_position)





func get_hit(damage):#damages and deletes skeleton
	skeleHP -= damage
	print("enemy was hit, HP:" + str(skeleHP))
	if skeleHP <= 0:#add more complex death btw
		queue_free()


func follow():#makes skeleton follow the player
	if player.HP <= 0:
		target_position = Vector2.ZERO
	else:
		player_position = player.position
		target_position = (player_position - position).normalized()
		if position.distance_to(player_position) > 3:
			move_and_collide(target_position * speed)
	return target_position
	return player_position


func animation(tp):#adjusts animation tree based on movements
	if position.distance_to(player.position) > 200:
		$SkeleAnim/AnimationTree.get("parameters/playback").travel("Idle")
		return
	else:
		if tp == Vector2.ZERO:
			$SkeleAnim/AnimationTree.get("parameters/playback").travel("Idle")
		else:
			$SkeleAnim/AnimationTree.get("parameters/playback").travel("Walk")
			$SkeleAnim/AnimationTree.set("parameters/Idle/blend_position", tp)
			$SkeleAnim/AnimationTree.set("parameters/Walk/blend_position", tp)
	if position.distance_to(player.position) < 30:
		$SkeleAnim/AnimationTree.get("parameters/playback").travel("Idle")
		return
