package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";
	public static var currChanges:String = "dk";

	var funs:Int = 0;
	
	private var bgColors:Array<String> = [
		'#314d7f',
		'#4e7093',
		'#70526e',
		'#594465'
	];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('week54prototype', 'shared'));
		bg.scale.x *= 1.55;
		bg.scale.y *= 1.55;
		bg.screenCenter();
		add(bg);
		
		var kadeLogo:FlxSprite = new FlxSprite(FlxG.width, 0).loadGraphic(Paths.image('logoStatic'));
		kadeLogo.scale.y = 0.3;
		kadeLogo.scale.x = 0.3;
		kadeLogo.x -= kadeLogo.frameHeight;
		kadeLogo.y -= 180;
		kadeLogo.alpha = 0.8;
		add(kadeLogo);
		
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"Yo Thanks for downloading our mod! \n This is a joke mod, but it has story that will be more explained in week 2 and 3 \n Enjoy the mod!", 
			40);
		
		txt.setFormat("VCR OSD Mono", 37, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);

		function fun() {
			new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					txt.text += "\n way";
					new FlxTimer().start(0.9, function(tmr:FlxTimer)
						{
							txt.text += "\n inc";
							new FlxTimer().start(0.8, function(tmr:FlxTimer)
								{
									txt.text += "\n will";
									new FlxTimer().start(0.7, function(tmr:FlxTimer)
										{
											txt.text += "\n be";
											new FlxTimer().start(0.6, function(tmr:FlxTimer)
												{
													txt.text += "\n waiting";
													new FlxTimer().start(0.5, function(tmr:FlxTimer)
														{
															txt.text += "\n for";
															new FlxTimer().start(0.4, function(tmr:FlxTimer)
																{
																	txt.text += "\n you";
																	new FlxTimer().start(0.3, function(tmr:FlxTimer)
																		{
																			txt.text += "\n way";
																			new FlxTimer().start(0.2, function(tmr:FlxTimer)
																				{
																					txt.text += "\n way";
																					txt.y -= 50;
																					new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																						{
																							txt.text += "\n way";
																							txt.y -= 50;
																							new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																								{
																									txt.text += "\n way";
																									txt.y -= 50;
																									new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																										{
																											txt.text += "\n way";
																											txt.y -= 50;
																											new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																												{
																													txt.text += "\n way";
																													txt.y -= 50;
																													new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																														{
																															txt.text += "\n way";
																															txt.y -= 50;
																															new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																																{
																																	txt.text += "\n way";
																																	txt.y -= 50;
																																	new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																																		{
																																			txt.text += "\n way";
																																			txt.y -= 50;
																																			new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																																				{
																																					txt.text += "\n way";
																																					txt.y -= 50;
																																					new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																																						{
																																							txt.text += "\n way";
																																							txt.y -= 50;
																																							new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																																								{
																																									txt.text += "\n way";
																																									new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																																										{
																																											txt.text += "\n way";
																																											new FlxTimer().start(0.1, function(tmr:FlxTimer) //this code is shit
																																												{
																																													txt.text += "\n way";
																																													leftState = true;
																																													FlxG.switchState(new MainMenuState());
																																												});
																																										});
																																								});
																																						});
																																				});
																																		});
																																});
																														});
																												});
																										});
																								});
																						});
																				});
																		});
																});
														});
												});
										});
								});
						});
				});
		}
		
		FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
		FlxTween.angle(kadeLogo, kadeLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
			if(colorRotation < (bgColors.length - 1)) colorRotation++;
			else colorRotation = 0;
		}, 0);
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			if(kadeLogo.angle == -10) FlxTween.angle(kadeLogo, kadeLogo.angle, 10, 2, {ease: FlxEase.quartInOut});
			else FlxTween.angle(kadeLogo, kadeLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		}, 0);
		
		new FlxTimer().start(0.8, function(tmr:FlxTimer)
		{
			if(kadeLogo.alpha == 0.8) FlxTween.tween(kadeLogo, {alpha: 1}, 0.8, {ease: FlxEase.quartInOut});
			else FlxTween.tween(kadeLogo, {alpha: 0.8}, 0.8, {ease: FlxEase.quartInOut});
		}, 0);

		new FlxTimer().start(9, function(tmr:FlxTimer)
		{
			fun();
		});
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			// fancyOpenURL("https://kadedev.github.io/Kade-Engine/changelogs/changelog-" + needVer);
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		if (FlxG.keys.justPressed.NINE)
		{
			fancyOpenURL("https://soundcloud.com/gema-police4123/tittle-song-official-way-funkin-ost");
		}
		super.update(elapsed);
	}
}
