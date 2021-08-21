package;
import flixel.*;

/**
 * ...
 * @author bbpanzu
 */
 //thank you mister bbpanzu
class PiracyScreen extends MusicBeatState
{

	public function new() 
	{
		super();
	}
	
	override function create() 
	{
		super.create();
		
		var trolled:FlxSprite = new FlxSprite().loadGraphic(Paths.image("piracylol"));
		add(trolled);
	}
	
	
	override function update(elapsed:Float) 
	{
		super.update(elapsed);
		
		if (controls.ACCEPT)
        {
			FlxG.switchState(new MainMenuState());
		}
        if (controls.BACK)
        {
            FlxG.openURL("https://gamebanana.com/members/1777170"); //no download 
        }
	}
}