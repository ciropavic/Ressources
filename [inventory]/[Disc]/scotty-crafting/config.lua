Config = {}
Config["debug"] = true -- Desactiva el modo de desarrollo (Se usa para abrir el comando sc_bench)
Config["craft_duration"] = 5 -- El tiempo que lleva la elaboración inicial.
Config["craft_duration_multiply"] = true -- ¿Multiplicará el tiempo si se elabora más de una pieza?
Config["craft_duration_max"] = 30 --Establezca el tiempo máximo de elaboración si se excede. Volverá a este valor, ajústelo a cero o elimine esta línea si desea desbloquearlo.
Config["craft_enable_fail"] = false -- Abrir, cerrar, falla en la tasa de elaboración
Config["craft_cost"] = 1000 -- ¿Desperdiciar dinero en la construcción?
Config["craft_table"] = {
	{
		position = {x = -971.42, y = 1981.26, z = 12.73, h = 270.64},
		max_distance = 2.0, -- ระยะที่สามารถใช้โต๊ะได้
		map_blip = true,
		blip_name = "Limpiadora"
	},
}

--[[
	ทุกครั้งที่มีการต่อเพิ่มในตารางอย่าลืมใส่ , ที่ปีกกาปิดของอันเก่า
	
	ตัวอย่างการเพิ่ม หมวด
	[1] = { -- ต้องใช้เป็นเลขใหม่ต่อท้ายหมวดเก่า
		name = "หมวดทั่วไป", -- ชื่อหมวด
		animation = { -- เพิ่มอนิเมชั้นเองโดยเปลี่ยนทั้งหมวด ลบหากต้องการใช้แบบธรรมดา
			dict = "world_human_welding",
			anim = "world_human_welding",
			flag = 30
		},
		list = { -- สำหรับเพิ่มไอเทม ต้องใส่ภายในปีกกาเท่านั้น
		}
	}
		
	ตัวอย่างการเพิ่ม ไอเทมลงในหมวด
	{
		item = "cloth", --ชื่อของไอเทม
		fail_chance = 15, --โอกาสที่จะล้มเหลวเวลาคราฟ
		amount = 3, --เมื่อคราฟแล้วจะได้กี่ชิ้น
		cost = 500, -- เพิ่มราคาคราฟ ถ้าไม่มีจะยึดจาก Config["craft_cost"]
		
		craft_duration = 10, -- สำหรับปรับเวลาที่จะใช้คราฟของชิ้นนี้
		
		animation = { -- เพิ่มอนิเมชั้นเองโดยเปลี่ยนแค่ชิ้นนี้ สามารถลบออกได้ถ้าไม่ต้องการ
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger",
			flag = 30
		},
		
		equipment = { -- ถ้าต้องมีอุปกรณ์บางชิ้นก่อนถึงใส่ได้ให้เพิ่ม ถ้าไม่มีให้ลบออก
			["scissors"] = true, -- => true คือ เปิด false คือปิด
			["pro_wood"] = false -- ทั้งหมดหมายความว่าต้องการแค่กรรไกรในการคราฟ
		},
		
		blueprint = { -- ลิสของที่ต้องการ => ["ชื่อของไอเทม"] = @จำนวนที่ใช้
			["leather"] = 1, -- => หนังสัตว์ 1 ชิ้น
			["wood"] = 2 -- => ไม้ 2 ท่อน
		},
	},
]]

Config["category"] = {
	
	[1] = {
				name = "FALSIFICADOR",
	list = 	{
				
			   {
					item = "cash",
					fail_chance = 100,
					amount = 15000,
					cost = 0,
					craft_duration = 10,
					blueprint = {
					["black_money"] = 15000
					},
					equipment = {
						["weaponcard"] = true,
					}
				}			
			
			}
	},
}

Config["translate"] = {
	you_crafted = "¡Has hecho %s% de piezas!",
	not_enough = "No hay suficientes ingredientes",
	not_enough2 = "Prepara los ingredientes.",
	you_blow = "Fallaste en crear %s",
	no_equipment = "No tienes equipo",
	no_equipment2 = "El equipo es necesario para fabricar este artículo.",
	no_money = "Dinero insuficiente",
	no_money2 = "Necesitas €%s para crear."
}