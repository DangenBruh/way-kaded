package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-rtx', [0, 1], 0, false, isPlayer);
		animation.add('bf-sus-first', [28, 29], 0, false, isPlayer);
		animation.add('bf-sus-second', [28, 29], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
		animation.add('way', [24, 26], 0, false, isPlayer);
		animation.add('way-pixel', [37, 37], 0, false, isPlayer);
		animation.add('way-angy', [25, 26], 0, false, isPlayer);
		animation.add('way-mad', [27, 27], 0, false, isPlayer);
		animation.add('expurgation', [32, 32], 0, false, isPlayer);
		animation.add('way-dead', [40, 40], 0, false, isPlayer);
		animation.add('gf', [16], 0, false, isPlayer);
		animation.add('gf-pixel', [16], 0, false, isPlayer);
		animation.add('gf-christmas', [16], 0, false, isPlayer);
		animation.add('speakers', [33], 0, false, isPlayer);
		animation.add('jads', [33, 33], 0, false, isPlayer);
		animation.add('atsuover', [34, 34], 0, false, isPlayer);
		animation.add('mike', [35, 35], 0, false, isPlayer);
		animation.add('celshader', [36, 36], 0, false, isPlayer);
		animation.add('crewmate', [30, 31], 0, false, isPlayer);
		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel' | 'way-pixel':
				antialiasing = false;
		}

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
