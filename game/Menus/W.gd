extends VFlowContainer

@onready var player = get_parent().get_parent().get_node("CharacterBody2D")

func _process(_delta):
	$Label.text = "weapon: " + player.weapon_val
