extends Control

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://World/main.tscn")
	queue_free()


func _on_return_pressed():
	get_tree().change_scene_to_file("res://Screens/mainmenu.tscn")
	queue_free()
