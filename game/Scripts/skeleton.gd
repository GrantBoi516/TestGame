extends CharacterBody2D


@export var skeleHP = 30
@export var speed = 1
var player_position
var target_position
@onready var player = get_parent().get_node("CharacterBody2D")


func _physics_process(delta):
	follow()


func get_hit(damage):#damages and deletes skeleton
	skeleHP -= damage
	print("enemy was hit, HP:" + str(skeleHP))
	if skeleHP <= 0:#add more complex death btw
		queue_free()


func follow():#makes skeleton follow the player
	player_position = player.position
	target_position = (player_position - position).normalized()
	if position.distance_to(player_position) > 3:
		move_and_collide(target_position * speed)
	return player_position
