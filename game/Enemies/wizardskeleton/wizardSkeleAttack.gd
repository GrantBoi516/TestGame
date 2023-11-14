extends Area2D


@onready var anim = $SkeleAttack
@onready var player = get_parent().get_parent().get_node("/root/level/CharacterBody2D")
@export var damage := 1
@onready var skeleton = get_parent()




func _ready():
	$Sprite2D.hide()




func _physics_process(delta):
	look_at(player.position)#points swing towards player




func _on_body_entered(body: Node) -> void:#detects when it collides with and enemy and deals damage
	if body.has_method("player_hit"):
		$Sprite2D.show()
		anim.play("attack")
		await get_tree().create_timer(.5).timeout
		$Sprite2D.hide()




func atk():
	move_and_slide(player.postition)
	player.player_hit(damage)
