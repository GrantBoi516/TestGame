extends Timer
@onready var spawnArea = get_parent().get_node("CharacterBody2D/Camera2D/SpawnArea")
@onready var origin = $CollisionShape2D.global_position -  spawnArea


func gen_random_pos():
	var x = random.randi_range(origin.x, spawnArea.x)
	var y = random.randi_range(origin.y, spawnArea.y)
	
	return Vector2(x, y)
var random = RandomNumberGenerator.new()
var skele = preload("res://Enemies/skeleton/skeleton.tscn")
var lvl = 0
func _ready():
	next_lvl()
func next_lvl():
	lvl += 1
	var x = 0
	while x <= lvl:
		var instancedSkele = skele.instantiate()
		var instancedSkele2 = skele.instantiate()
		var instancedSkele3 = skele.instantiate()
		var instancedSkele4 = skele.instantiate()
		get_parent().get_node("CharacterBody2D/Camera2D/SpawnArea").call_deferred("add_child", instancedSkele)
		instancedSkele.position = gen_random_pos()
		get_parent().get_node("CharacterBody2D/Camera2D/SpawnArea").call_deferred("add_child", instancedSkele2)
		instancedSkele2.position = gen_random_pos()
		get_parent().get_node("CharacterBody2D/Camera2D/SpawnArea").call_deferred("add_child", instancedSkele3)
		instancedSkele3.position = gen_random_pos()
		get_parent().get_node("CharacterBody2D/Camera2D/SpawnArea").call_deferred("add_child", instancedSkele4)
		instancedSkele4.position = gen_random_pos()
		x += 1
		print("boop")
