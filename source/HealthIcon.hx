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
		animation.add('bf', [0, 1, 30], 0, false, isPlayer);
		animation.add('bf-old', [2, 3, 31], 0, false, isPlayer);
		animation.add('bf-rtx', [0, 1, 30], 0, false, isPlayer);
		animation.add('bf-sus-first', [12, 13, 12], 0, false, isPlayer);
		animation.add('bf-sus-second', [12, 13, 12], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1, 30], 0, false, isPlayer);
		animation.add('bf-pixel', [5, 5, 5], 0, false, isPlayer);
		animation.add('way', [8, 10, 32], 0, false, isPlayer);
		animation.add('way-flip', [8, 10, 32], 0, false, isPlayer);
		animation.add('way-pixel', [21, 21, 21], 0, false, isPlayer);
		animation.add('way-angy', [9, 10, 33], 0, false, isPlayer);
		animation.add('way-mad', [11, 11, 11], 0, false, isPlayer);
		animation.add('expurgation', [16, 16, 34], 0, false, isPlayer);
		animation.add('way-dead', [40, 40, 40], 0, false, isPlayer);
		animation.add('way-dead-second', [40, 40, 40], 0, false, isPlayer);
		animation.add('test', [6, 7, 6], 0, false, isPlayer);
		animation.add('gf', [4, 4, 4], 0, false, isPlayer);
		animation.add('gf-pixel', [4, 4, 4], 0, false, isPlayer);
		animation.add('gf-christmas', [4, 4, 4], 0, false, isPlayer);
		animation.add('speakers', [60, 60, 60], 0, false, isPlayer);
		animation.add('speakers-sus', [60, 60, 60], 0, false, isPlayer);
		animation.add('jads', [17, 17, 17], 0, false, isPlayer);
		animation.add('atsuover', [18, 18, 18], 0, false, isPlayer);
		animation.add('mike', [19, 19, 19], 0, false, isPlayer);
		animation.add('celshader', [20, 20, 20], 0, false, isPlayer);
		animation.add('phlox', [22, 22, 22], 0, false, isPlayer);
		animation.add('kawaisprite', [23, 23, 23], 0, false, isPlayer);
		animation.add('crewmate', [14, 15, 35], 0, false, isPlayer);
		animation.add('mark-bs', [6, 7, 6], 0, false, isPlayer);
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
