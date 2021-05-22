stop();
_root.warpframe = false;
onEnterFrame = function()
{
   if(this.warp1.hitTest(_root.Course.Char.charClip.feet) && _root.Course.Char.yspeed < 0)
   {
      _root.Course.Char.attack = true;
      _root.Course.Char.xspeed = 0;
      _root.Course.Char.yspeed = 0;
      _root.Course.Char.attackFrame = "none";
      warp = true;
      warpnum = 1;
   }
   if(warp == true && _root.warpframe == false)
   {
      if(warpnum == 1)
      {
         if(_root.TotalStars == 63 && _root.TotalStarCoins == 64 && !_root.Star[36] && _root.BowserKey1 == true && _root.BowserKey2 == true && _root.BowserKey3 == true || _root.timerMode == "Any")
         {
            _root.timerRunning = false;
         }
         _root.attachMovie("uptransition","uptransition" + _root.getNextHighestDepth(),_root.getNextHighestDepth(),{_x:_root.screensizeX / 2,_y:_root.screensizeY / 2});
      }
      warp = false;
   }
   if(_root.warpframe == true)
   {
      if(warpnum == 1)
      {
         _root.gotoAndStop("Credits");
         _root.RemoveCourse();
      }
   }
};
