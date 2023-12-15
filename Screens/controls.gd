extends Control

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Screens/mainmenu.tscn")




func _on_start_pressed():
	MainMenuMusicPlayer.stop()
	get_tree().change_scene_to_file("res://World/main.tscn")
