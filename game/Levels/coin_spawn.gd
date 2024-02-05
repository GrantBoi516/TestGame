extends Area2D
@onready var coin = load("res://Items/coin.tscn")
var tmp = 0
func _on_body_entered(_body: Node) -> void:
	while tmp <= 10:
		var instancedCoin = coin.instantiate()
		get_parent().call_deferred("add_child", instancedCoin)
		tmp += 1
	tmp = 1
