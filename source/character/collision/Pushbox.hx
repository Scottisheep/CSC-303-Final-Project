package character.collision;

import flixel.math.FlxPoint;
import flixel.FlxObject;

class Pushbox extends FlxObject {

    private var chr:Character;

    override public function new(c:Character) {
        chr = c;
        super(chr.position.x, chr.position.y);
        setSize(chr.width, chr.height);
    }

    override function update(elapsed:Float) {
        chr.position = FlxPoint.weak(x, y);
        super.update(elapsed);
    }
}