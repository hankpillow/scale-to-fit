# About:

This is just a very simple class which does scaling objects keeping their proportion.

The good stuff is that this class can scale properly your object by cropping (using the lower value) it or just fitting by the highest dimension.

The class API was designed to be ease and intuitive.

##Simple fit:##
<code>
resize(a).toFitIn(b);
</code>
* * *
##Crop:##

Resize by the lower dimension:

<code>
resize(a).toFitIn(b, true);
</code>
* * *
##Multipliers##

In case of resizing videos this [link](http://labs.influxis.com/?p=6)
has a good explanation about how important is keeping the proper dimension in videos:

<code>
resize(a).multipleOf( 16 ).toFitIn(b);
</code>
* * *
##Tweening##

If you are that guy who loves doing this scale using *"tween"*, I did a method for you:

<code>
var r : Rectangle = resize(a).simulate().toFitIn(b).bounds
Tweener.addTween( a, {width:r.width, height:r.height, time:0.5} );
</code>