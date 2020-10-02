tool
extends Area2D

export var next_scene: PackedScene

onready var animation: AnimationPlayer = $AnimationPlayer

func _on_Portal_body_entered(body: Node) -> void:
	teleport()

func _get_configuration_warning() -> String:
	return "The next scene property can't be empty" if not next_scene else ""

func teleport() -> void:
	animation.play("fade_in")
	yield(animation, "animation_finished")
	get_tree().change_scene_to(next_scene)
