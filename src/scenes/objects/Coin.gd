extends Area2D

onready var animation: AnimationPlayer = get_node("AnimationPlayer")

func _on_Coin_body_entered(body: Node) -> void:
	animation.play("fade_out")
