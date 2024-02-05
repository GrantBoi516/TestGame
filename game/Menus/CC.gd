extends HFlowContainer

@onready var player = get_parent().get_parent().get_node("CharacterBody2D")

func _process(_delta):
	$Label.text = str(player.coins) + "/" + str(player.lvl_price)

