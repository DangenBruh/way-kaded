package;
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

// author bbpanzu
// thank u bbpanzu, f sky mod

class EndingState extends FlxState

{
	var _badEnding:Bool = false;
	

	public function new(badEnding:Bool = true)
	{
		super();
		_badEnding = badEnding;
	};
	
	override public function create():Void
	{
		super.create();
		var end:FlxSprite = new FlxSprite(0, 0);
		if (_badEnding)
		{
			end.loadGraphic(Paths.image("endings/badending" + PlayState.language));
			FlxG.sound.playMusic(Paths.music("badending"),1,false);
			FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		}
		else
		{
			FlxG.switchState(new StoryMenuState());
		}
		add(end);
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.ENTER){
			endIt();
		}
		
	}
	
	
	public function endIt(e:FlxTimer=null){
		trace("ENDING");
		FlxG.switchState(new StoryMenuState());
	}
	
}