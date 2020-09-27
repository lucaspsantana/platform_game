extends "res://src/scripts/Actor.gd"

func _ready() -> void:
	_velocity.x = -speed.x  #começa indo para a esquerda
	set_physics_process(false)


func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true
	print(body)
	queue_free()
	#compara o eixo y do stompDetector em relação ao mundo
	#em relação ao jogador que colide


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta #faz com que fique no chão
	if is_on_wall(): #se colidir com a parede
		_velocity.x *= -1.0  #se colidir vaia para o lado oposto
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

