extends CharacterBody2D


@onready var anim = $SkeleAttack
@onready var player = get_parent().get_node("CharacterBody2D")
@export var damage := 1
var player_position = player.position
var target_position = (player_position - position).normalized()



func _ready():
	$Sprite2D.show()




func _physics_process(delta):
	look_at(player.position)#points swing towards player
	await get_tree().create_timer(1).timeout
	move_and_collide(target_position)


func _on_body_entered(body: Node) -> void:#detects when it collides with and enemy and deals damage
	if body.has_method("player_hit"):
		await get_tree().create_timer(.5).timeout
		atk()


func atk():
	player.player_hit(damage)
