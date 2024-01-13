extends Value

signal add_miner

func update_bv(value):
	print("emit signal")
	emit_signal("add_miner")
