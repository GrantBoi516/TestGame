extends Area2D
@onready var anim = $SkeleAttack
@onready var player = get_parent().get_parent().get_node("CharacterBody2D")
@export var damage := 10
func _physics_process(delta):
	look_at(player.position)#points swing towards player

func attack():#attack method referenced in parent script
	anim.play("attack")


func _on_body_entered(body: Node) -> void:#detects when it collides with and enemy and deals damage
	if body.has_method("player_hit"):
		body.player_hit(damage)
