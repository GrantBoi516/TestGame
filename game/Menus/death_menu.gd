extends CanvasLayer



func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://Levels/template.tscn")


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
