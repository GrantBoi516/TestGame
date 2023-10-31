extends Area2D


@onready var anim = $SkeleAttack
@onready var player = get_parent().get_parent().get_node("CharacterBody2D")
@export var damage := 10
@onready var skeleton = get_parent()

func _physics_process(delta):
	look_at(player.position)#points swing towards player







func _on_body_entered(body: Node) -> void:#detects when it collides with and enemy and deals damage
	while body_entered:
		if body.has_method("player_hit"):
			anim.play("attack")
			await get_tree().create_timer(.5).timeout
func atk(body):
	player.player_hit(damage)
