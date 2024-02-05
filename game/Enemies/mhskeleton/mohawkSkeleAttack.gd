extends Area2D



@onready var anim = $SkeleAttack
@onready var player = get_parent().get_parent().get_node("/root/level/CharacterBody2D")
@export var damage := 2
@onready var skeleton = get_parent()





func _ready():
	$Sprite2D.hide()




func _physics_process(_delta):
	look_at(player.position)




func _on_body_entered(body: Node) -> void:
	if body.has_method("player_hit"):
		$Sprite2D.show()
		anim.play("attack")




func attack():
	player.player_hit(damage)



func _on_body_exited(_body):
	$Sprite2D.hide()
	anim.stop()
