////////////
//Forging//
////////////

/datum/crafting_recipe/forge
	name = "Forge"
	result = /obj/machinery/workbench/forge
	reqs = list(/obj/item/stack/sheet/mineral/wood = 10,
				/obj/item/lighter = 1,
				/obj/item/twohanded/sledgehammer = 1,
				/obj/item/screwdriver = 1,
				/obj/item/crowbar = 1,
				/obj/item/wrench = 1,
				/obj/item/wirecutters = 1,
				/obj/item/stack/sheet/metal = 50)
	time = 400
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/ring_silver
	name = "Silver Ring"
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/silver = 10)
	result = /obj/item/clothing/gloves/ring/silver
	tools = list(TOOL_FORGE)
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/ring_gold
	name = "Gold Ring"
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/gold = 10)
	result = /obj/item/clothing/gloves/ring
	tools = list(TOOL_FORGE)
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/ring_diamond
	name = "Diamond Ring"
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/gold = 20,
				/obj/item/stack/sheet/mineral/diamond = 10)
	result = /obj/item/clothing/gloves/ring/diamond
	tools = list(TOOL_FORGE)
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/stick
	name = "Wooden Handle"
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 1)
	result = /obj/item/stick
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/swordhilt
	name = "Sword Hilt"
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 2)
	result = /obj/item/swordhandle
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/barrelfire
	name = "Stoke barrel fire"
	result = /obj/structure/campfire/barrel
	reqs = list(/obj/item/stack/sheet/mineral/wood = 15,
				/obj/item/stack/sheet/metal = 10)
	time = 80
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/toolboxhammer
	name = "Toolbox Hammer"
	result = /obj/item/melee/smith/hammer/toolbox
	tools = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	reqs = list(/obj/item/storage/toolbox = 1,
							/obj/item/stack/sheet/metal = 4,
							/obj/item/stack/rods = 2)
	time = 40
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/tableanvil
	name = "Table Anvil"
	result = /obj/structure/anvil/obtainable/table
	time = 300
	reqs = list(/obj/item/stack/sheet/metal = 4,
				/obj/item/stack/rods = 2)
	tools = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/anvil
	name = "Anvil"
	result = /obj/structure/anvil/obtainable/basic
	time = 450
	reqs = list(/obj/item/stack/sheet/metal = 50,
				/obj/item/stack/rods = 5,
				/obj/item/stack/sheet/mineral/titanium = 15)
	tools = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER, TOOL_CROWBAR)
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/sandvil
	name = "Sandstone Anvil"
	result = /obj/structure/anvil/obtainable/sandstone
	time = 300
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 24)
	tools = list(TOOL_CROWBAR)
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/basaltblock
	name = "Sintered Basalt Block"
	result = /obj/item/basaltblock
	time = 200
	reqs = list(/obj/item/stack/ore/glass/basalt = 50)
	tools = list(TOOL_WELDER)
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/basaltanvil
	name = "Basalt Anvil"
	result = /obj/structure/anvil/obtainable/basalt
	time = 200
	reqs = list(/obj/item/basaltblock = 5)
	tools = list(TOOL_CROWBAR)
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/furnace
	name = "Sandstone Furnace"
	result = /obj/structure/furnace
	time = 300
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 15,
	/obj/item/stack/sheet/metal = 4,
	/obj/item/stack/rods = 2)
	tools = list(TOOL_CROWBAR)
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

/datum/crafting_recipe/barrelfire
	name = "Stoke barrel fire"
	result = /obj/structure/campfire/barrel
	reqs = list(/obj/item/stack/sheet/mineral/wood = 15,
				/obj/item/stack/sheet/metal = 10)
	time = 80
	category = CAT_CRAFTING
	subcategory = CAT_FORGING

//KNIVES//

/datum/crafting_recipe/butchers
	name = "Butchers Knife"
	result = /obj/item/kitchen/knife/butcher
	time = 100
	reqs = list(/obj/item/stack/sheet/metal = 3,
				/obj/item/stack/sheet/cloth = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/combat
	name = "Hunting Knife"
	result = /obj/item/melee/onehanded/knife/hunting
	time = 150
	reqs = list(/obj/item/stack/sheet/metal = 3,
				/obj/item/stack/sheet/cloth = 2)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/bayonet
	name = "Bayonet Knife"
	result = /obj/item/melee/onehanded/knife/bayonet
	time = 300
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/sheet/cloth = 2)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/kitchen
	name = "Kitchen Knife"
	result = /obj/item/kitchen/knife
	time = 30
	reqs = list(/obj/item/stack/sheet/metal = 2,
				/obj/item/stack/sheet/cloth = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/ritual
	name = "Ritual Knife"
	result = /obj/item/kitchen/knife/ritualdagger
	time = 120
	reqs = list(/obj/item/stack/sheet/metal = 2,
				/obj/item/stack/sheet/cloth = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/survival
	name = "Survival Knife"
	result = /obj/item/melee/onehanded/knife/survival
	time = 100
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/sheet/cloth = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/survival
	name = "Switchblade"
	result = /obj/item/melee/onehanded/knife/switchblade
	time = 40
	reqs = list(/obj/item/stack/sheet/metal = 4,
				/obj/item/stack/sheet/cloth = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/bowie_knife
	name = "Bowie Knife"
	result = /obj/item/melee/onehanded/knife/bowie
	reqs = list(/obj/item/stack/sheet/metal = 4,
				/obj/item/stack/sheet/mineral/wood = 2)
	time = 200
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/trench_knife
	name = "Trench Knife"
	result = /obj/item/melee/onehanded/knife/trench
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/crafting/goodparts = 2,
				/obj/item/stack/sheet/mineral/wood = 2)
	time = 280
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

//swords
/datum/crafting_recipe/bmprsword
	name = "Bumper Sword"
	result = /obj/item/twohanded/fireaxe/bmprsword
	reqs = list(/obj/item/stack/sheet/metal = 25,
				/obj/item/stack/sheet/cloth = 2)
	time = 400
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/reinforcemachete
	name = "Machete"
	result = /obj/item/melee/onehanded/machete/forgedmachete
	reqs = list(/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/sheet/cloth = 2)
	time = 180
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/*
/datum/crafting_recipe/shortsword
	name = "Shortsword"
	result = /obj/item/claymore
	reqs = list(/obj/item/stack/sheet/metal = 15,
				/obj/item/stack/sheet/cloth = 2)
	time = 280
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
*/

// LEGION SPECIFIC

/datum/crafting_recipe/spatha
	name = "Spatha"
	result = /obj/item/melee/onehanded/machete/spatha
	reqs = list(/obj/item/stack/sheet/metal = 18,
			/obj/item/stack/sheet/plasteel = 2,
				/obj/item/stack/sheet/leather = 2, //custom hilt -
				/obj/item/stack/sheet/bronze = 4,  //made from scratch -
				/obj/item/stack/sheet/bone = 4)    //see desc for more info.
	time = 380
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
	always_availible = FALSE

/datum/crafting_recipe/gladius
	name = "Gladius"
	result = /obj/item/melee/onehanded/machete/gladius
	reqs = list(/obj/item/stack/sheet/metal = 15,
				/obj/item/stack/sheet/cloth = 2,
				/obj/item/swordhandle = 1) //objects of mass production don't require hilts more than 2 wood.
	time = 280
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
	always_availible = FALSE

/datum/crafting_recipe/legionshield
	name = "Legion Shield"
	result = /obj/item/shield/riot/legion
	reqs = list(/obj/item/stack/sheet/metal = 8,
				/obj/item/stack/sheet/mineral/wood = 8,
				/obj/item/stack/sheet/leather = 2)
	time = 250
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
	always_availible = FALSE

/datum/crafting_recipe/lance
	name = "Lance"
	result = /obj/item/twohanded/spear/lance
	reqs = list(/obj/item/stack/sheet/metal = 20,
				/obj/item/stack/sheet/mineral/wood = 6)
	time = 180
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
	always_availible = FALSE

//polearms


/datum/crafting_recipe/forgespear
	name = "Spear"
	result = /obj/item/twohanded/spear
	time = 200
	reqs = list(/obj/item/stack/sheet/metal = 16,
				/obj/item/stack/sheet/mineral/wood = 4)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/forgethrowingspear
	name = "Throwing Spear"
	result = /obj/item/throwing_star/spear
	time = 120
	reqs = list(/obj/item/stack/sheet/metal = 2,
				/obj/item/stack/sheet/mineral/wood = 3)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/*
/datum/crafting_recipe/harpoon
	name = "Harpoon"
	result = /obj/item/throwing_star/spear/harpoon
	time = 400
	reqs = list(/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
*/

/datum/crafting_recipe/scythe
	name = "Scythe"
	result = /obj/item/scythe
	time = 120
	reqs = list(/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/sheet/mineral/wood = 4)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

//blunt

/datum/crafting_recipe/sledge
	name = "Sledgehammer"
	result = /obj/item/twohanded/sledgehammer
	time = 700
	reqs = list(/obj/item/stack/sheet/metal = 25,
				/obj/item/stack/sheet/mineral/wood = 5)
	tools = list(TOOL_WORKBENCH, TOOL_WELDER)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/pan
	name = "Frying Pan"
	result = /obj/item/melee/onehanded/club/fryingpan
	time = 80
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/sheet/mineral/wood = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

//miscweapons

/*
/datum/crafting_recipe/throwingknife
	name = "Throwing Knife"
	result = /obj/item/throwing_star/throwingknife
	reqs = list(/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/sheet/cloth = 1)
	time = 300
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE


/datum/crafting_recipe/pipe
	name = "Pipe"
	result = /obj/item/melee/onehanded/club
	time = 50
	reqs = list(/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/fire_axe
	name = "Fire Axe"
	result = /obj/item/twohanded/twohanded/fireaxe
	time = 300
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/sheet/mineral/wood = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
*/

/datum/crafting_recipe/pick_axe
	name = "Pickaxe"
	result = /obj/item/pickaxe
	time = 150
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/sheet/mineral/wood = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/*
/datum/crafting_recipe/cpick_axe
	name = "Compact Pickaxe"
	result = /obj/item/pickaxe/mini
	time = 300
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/sheet/mineral/wood = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
*/

/datum/crafting_recipe/shovel
	name = "Shovel"
	result = /obj/item/shovel
	time = 150
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/sheet/mineral/wood = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/hatchet
	name = "Hatchet"
	result = /obj/item/hatchet
	time = 80
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/sheet/mineral/wood = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/entrenching_tool
	name = "Pattern 2281 Entrenching Tool"
	result = /obj/item/shovel/trench
	time = 150
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/sheet/cloth = 1,
				/obj/item/stack/sheet/mineral/wood = 1)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
	always_availible = FALSE


//fists

/datum/crafting_recipe/knucklespike
	name = "Spiked Knuckledusters"
	result = /obj/item/melee/unarmed/brass/spiked
	time = 140
	reqs = list(/obj/item/stack/sheet/metal = 3)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/sap
	name = "Sappers"
	result = /obj/item/melee/unarmed/sappers
	time = 180
	reqs = list(/obj/item/stack/sheet/metal = 3,
				/obj/item/stack/sheet/lead = 2)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/maceglove
	name = "Mace Glove"
	result = /obj/item/melee/unarmed/maceglove
	time = 240
	reqs = list(/obj/item/stack/sheet/metal = 20)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/cosmicknife
	name = "Cosmic Knife"
	result = /obj/item/melee/onehanded/knife/cosmic
	reqs = list(/obj/item/kitchen/knife/cosmicdirty = 1,
				/obj/item/crafting/abraxo = 1)
	tools = list(TOOL_WORKBENCH)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
	time = 30

/datum/crafting_recipe/cosmicknifeheated
	name = "Superheated Cosmic Knife"
	result = /obj/item/melee/onehanded/knife/cosmicheated
	reqs = list(/obj/item/kitchen/knife/cosmic = 1,
				/datum/reagent/fuel = 25)
	tools = list(TOOL_WORKBENCH)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
	time = 40

/*
/datum/crafting_recipe/plate
	name = "Plate Armor"
	result = /obj/item/clothing/suit/armor/plate/crusader/plate
	time = 600
	reqs = list(/obj/item/stack/sheet/metal = 30,
				/obj/item/stack/sheet/cloth = 10)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
*/
/*
/datum/crafting_recipe/thejugg
	name = "Juggernaut Armor"
	result = /obj/item/clothing/suit/armor/plate/crusader/jugger
	time = 1000
	reqs = list(/obj/item/stack/sheet/metal = 90,
				/obj/item/stack/sheet/cloth = 3)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

/datum/crafting_recipe/thejugghelm
	name = "Juggernaut Helmet"
	result = /obj/item/clothing/head/helmet/plate/crusader/jugger
	time = 500
	reqs = list(/obj/item/stack/sheet/metal = 30,
				/obj/item/stack/sheet/cloth = 3)
	tools = list(TOOL_FORGE)
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE
*/


