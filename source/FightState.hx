package;

import character.Character;
import flixel.FlxG;
import flixel.FlxState;
import stage.ScreenBound;
import stage.Stage;

class FightState extends FlxState
{
	var player1:Character;
	var player2:Character;
	var stage:Stage;
	var leftScreenBound:ScreenBound;
	var rightScreenBound:ScreenBound;

	override function create()
	{
		super.create();
		initCharacters();
		initStage();

		FlxG.watch.add(player1, "direction");
	}

	override function update(elapsed:Float)
	{
		doCollision();
		super.update(elapsed);
	}

	private function initCharacters()
	{
		player1 = new Character(true, 1);
		player2 = new Character(false, 2);

		add(player1);
		add(player2);
	}

	private function initStage()
	{
		stage = new Stage(1);
		leftScreenBound = new ScreenBound(true);
		rightScreenBound = new ScreenBound(false);

		add(stage);
		add(leftScreenBound);
		add(rightScreenBound);
	}

	private function doCollision()
	{
		FlxG.collide(player1.pushbox, player2.pushbox);
		FlxG.collide(player1.pushbox, stage);
		FlxG.collide(player2.pushbox, stage);
		FlxG.collide(player1.pushbox, leftScreenBound);
		FlxG.collide(player2.pushbox, rightScreenBound);
	}
}
