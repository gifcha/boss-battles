extends BulletComponent
class_name BulletNode

func hit():
	var obj = 
	if obj.has_method("do_damage"):
		print("dealing dmg")
		obj.do_damage(self.damage)
