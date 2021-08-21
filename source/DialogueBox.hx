package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitGf:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'no-way':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'way':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'way':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				// box.x = -100;
				// box.y = 375;
				box.x = 67.15;
				box.y = 439.15;

			case 'always':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				// box.x = -100;
				// box.y = 375;
				box.x = 67.15;
				box.y = 439.15;

			case 'no-way':
				// if(portraitLeft.visible)
					hasDialog = true;
					box.frames = Paths.getSparrowAtlas('speech_bubble_talking', 'shared');
					box.animation.addByPrefix('normalOpen', 'speech bubble loud open', 24, false);
					box.animation.addByPrefix('normal', 'AHH speech bubble', 10, true);
					box.x = 37.05;
					box.y = 301.65;
				// if(portraitRight.visible || portraitGf.visible)
				// 	hasDialog = true;
				// 	box.frames = Paths.getSparrowAtlas('speech_bubble_talking', 'shared');
				// 	box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				// 	box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				// 	box.x = 67.15;
				// 	box.y = 439.15;

			// case 'sussy':
			// 	hasDialog = true;
			// 	box.frames = Paths.getSparrowAtlas('speech_bubble_talking', 'shared');
			// 	box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
			// 	box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
			//  box.x = -100;
			//  box.y = 375;
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		if (PlayState.SONG.song.toLowerCase() == 'way')
			{
				portraitLeft = new FlxSprite(113.4, 333.3);
				portraitLeft.frames = Paths.getSparrowAtlas('portraits/way enter', 'way');
				portraitLeft.animation.addByPrefix('enter', 'way enter', 24, false);
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;

				// portraitRight = new FlxSprite(699.35, 207.3);
				// portraitRight.frames = Paths.getSparrowAtlas('portraits/bf', 'way');
				// portraitRight.animation.addByPrefix('enter', 'bf enter', 24, false);
				// portraitRight.updateHitbox();
				// portraitRight.scrollFactor.set();
				// add(portraitRight);
				// portraitRight.visible = false;

				// portraitGf = new FlxSprite(425.55, 137.9);
				// portraitGf.frames = Paths.getSparrowAtlas('portraits/gf', 'way');
				// portraitGf.animation.addByPrefix('enter', 'GF Dancing Beat', 24, true);
				// portraitGf.updateHitbox();
				// portraitGf.scrollFactor.set();
				// add(portraitGf);
				// portraitGf.visible = false;
			}
		else if (PlayState.SONG.song.toLowerCase() == 'always')
			{
				portraitLeft = new FlxSprite(101.7, 300.4);
				portraitLeft.frames = Paths.getSparrowAtlas('portraits/way mad', 'way');
				portraitLeft.animation.addByPrefix('enter', 'way mad', 24, false);
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;

				// portraitRight = new FlxSprite(699.35, 207.3);
				// portraitRight.frames = Paths.getSparrowAtlas('portraits/bf', 'way');
				// portraitRight.animation.addByPrefix('enter', 'bf enter', 24, false);
				// portraitRight.updateHitbox();
				// portraitRight.scrollFactor.set();
				// add(portraitRight);
				// portraitRight.visible = false;

				// portraitGf = new FlxSprite(425.55, 137.9);
				// portraitGf.frames = Paths.getSparrowAtlas('portraits/gf', 'way');
				// portraitGf.animation.addByPrefix('enter', 'GF Dancing Beat', 24, true);
				// portraitGf.updateHitbox();
				// portraitGf.scrollFactor.set();
				// add(portraitGf);
				// portraitGf.visible = false;
			}
		else if (PlayState.SONG.song.toLowerCase() == 'no-way')
			{
				portraitLeft = new FlxSprite(156.9, 200.55);
				portraitLeft.frames = Paths.getSparrowAtlas('portraits/way ver angry', 'way');
				portraitLeft.animation.addByPrefix('enter', 'way mad 3', 24, false);
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;
			}
		if (PlayState.SONG.song.toLowerCase() == 'way' || PlayState.SONG.song.toLowerCase() == 'always')
			{
				portraitRight = new FlxSprite(699.35, 207.3);
				portraitRight.frames = Paths.getSparrowAtlas('portraits/bf', 'way');
				portraitRight.animation.addByPrefix('enter', 'bf enter', 24, false);
				portraitRight.updateHitbox();
				portraitRight.scrollFactor.set();
				add(portraitRight);
				portraitRight.visible = false;

				portraitGf = new FlxSprite(425.55, 137.9);
				portraitGf.frames = Paths.getSparrowAtlas('portraits/gf', 'way');
				portraitGf.animation.addByPrefix('enter', 'GF Dancing Beat', 24, true);
				portraitGf.updateHitbox();
				portraitGf.scrollFactor.set();
				add(portraitGf);
				portraitGf.visible = false;
			}
		else if (PlayState.SONG.song.toLowerCase() == 'no-way')
			{
				portraitRight = new FlxSprite(678.85, 207.3);
				portraitRight.frames = Paths.getSparrowAtlas('portraits/bf 3', 'way');
				portraitRight.animation.addByPrefix('enter', 'bf 3', 24, false);
				portraitRight.updateHitbox();
				portraitRight.scrollFactor.set();
				add(portraitRight);
				portraitRight.visible = false;

				portraitGf = new FlxSprite(446.05, 117.4);
				portraitGf.frames = Paths.getSparrowAtlas('portraits/gf 3', 'way');
				portraitGf.animation.addByPrefix('enter', 'GF Dancing Beat 3', 24, true);
				portraitGf.updateHitbox();
				portraitGf.scrollFactor.set();
				add(portraitGf);
				portraitGf.visible = false;
			}
		
		box.animation.play('normalOpen');
		box.updateHitbox();
		add(box);

		// handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		// add(handSelect);


		// if(portraitLeft.visible = true)
		// {
		// 	box.flipX = true;
		// }

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				portraitGf.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
					
			case 'bf':
				portraitLeft.visible = false;
				portraitGf.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
					
			case 'gf':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				if (!portraitGf.visible)
				{
					portraitGf.visible = true;
					portraitGf.animation.play('enter');
				}
			case 'bfgf':
				portraitLeft.visible = false;
				if (!portraitGf.visible)
				{
					portraitGf.visible = true;
					portraitGf.animation.play('enter');
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
