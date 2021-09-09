package;
import flixel.*;
import flixel.util.FlxColor;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;

/**
 * ...
 * @author bbpanzu
 */
 //based of piracy screen lol
class WaykScreen extends MusicBeatState
{

	public function new() 
	{
		super();
	}
	
	override function create() 
	{
		super.create();
		
		var lmaonowayk2foryoulol:FlxSprite = new FlxSprite().loadGraphic(Paths.image("wayk2"));
		add(lmaonowayk2foryoulol);

		var video:MP4Handler = new MP4Handler();
	}
	
	
	override function update(elapsed:Float) 
	{
		super.update(elapsed);
		
		if (controls.ACCEPT)
        {
            FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
			    FlxG.switchState(new StoryMenuState());
            });
		}
	}
}