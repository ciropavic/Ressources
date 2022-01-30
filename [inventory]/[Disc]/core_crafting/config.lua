Config = {

BlipSprite = 237,
BlipColor = 26,
BlipText = 'Lavanderia',

UseLimitSystem = false, -- Enable if your esx uses limit system

CraftingStopWithDistance = false, -- Crafting will stop when not near workbench

ExperiancePerCraft = 5, -- The amount of experiance added per craft (100 Experiance is 1 level)

HideWhenCantCraft = false, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job

Categories = {

['lavadero'] = {
	Label = 'Falsificador',
	Image = 'black_money',
	Jobs = {'ballas'}
}


},

PermanentItems = { -- Items that dont get removed when crafting
	['wrench'] = false
},

Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque

['cash'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'lavadero', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {'ballas'}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 150, -- The amount that will be crafted
	SuccessRate = 100, -- 100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['black_money'] = 50, -- item name and count, adding items that dont exist in database will crash the script
		['black_money'] = 50
	}
}

},

Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access

		{coords = vector3(-971.42,1981.26,13.73), jobs = {'ballas'}, blip = true, recipes = {}, radius = 3.0 }

},
 

Text = {

    ['not_enough_ingredients'] = 'Te falta dinero negro amigo!',
    ['you_cant_hold_item'] = 'No puedes sostener el artículo.',
    ['item_crafted'] = 'Limpiado',
    ['wrong_job'] = 'No puedes abrir este banco de trabajo',
    ['workbench_hologram'] = '[~b~E~w~] Falsificador',
    ['wrong_usage'] = 'Mal uso del comando',
    ['inv_limit_exceed'] = '¡Límite de inventario excedido! Limpia antes de perder más',
    ['crafting_failed'] = 'No lograste limpiar nada!'

}

}



function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
