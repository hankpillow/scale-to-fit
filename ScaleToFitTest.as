package
{	
	import flash.display.Sprite;
	import redneck.display.resize.*;

	[SWF(width='800', height='600', frameRate='60')]

	public class ScaleToFitTest extends Sprite
	{
		public function ScaleToFitTest()
		{
			super();
			
			var b : Sprite = addChild(new Sprite) as Sprite
			var a : Sprite = addChild(new Sprite) as Sprite
			
			a.graphics.beginFill(0,0.5)
			a.graphics.drawRect(0,0,150,40)
			a.graphics.endFill()

			b.graphics.beginFill(0xffffff)
			b.graphics.drawRect(0,0,512,288)
			b.graphics.endFill()

			resize(a).toFitIn(b);
			
			//using the lower value.
			//resize(a).toFitIn(b,true);

			//resize(a,{width:160,height:90}).multipleOf(16).toFitIn(b);

			//var r:* = resize(a).simulate().multipleOf(16).toFitIn(b).bounds;
			//a.width = r.width
			//a.height = r.height
		}

	}
}