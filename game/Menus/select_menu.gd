extends Control
@onready var player = get_parent().get_parent().get_node("CharacterBody2D")
func _process(_delta):
	player.get_node("hitbox").disabled = true
	player.HP = 69
func _on_sword_pressed():
	player.sword_change()
	player.get_node("hitbox").disabled = false
	player.HP = 4
	queue_free()
func _on_axe_pressed():
	player.axe_change()
	player.get_node("hitbox").disabled = false
	player.HP = 4
	queue_free()
func _on_rapier_pressed():
	player.rapier_change()
	player.get_node("hitbox").disabled = false
	player.HP = 4
	queue_free()
func _on_crossbow_pressed():
	player.crossbow_change()
	player.get_node("hitbox").disabled = false
	player.HP = 4
	queue_free()
