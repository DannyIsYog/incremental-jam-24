extends Value

signal add_transporter

func update_bv(value):
	print("emit signal")
	emit_signal("add_transporter")
