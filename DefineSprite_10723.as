if(_root.timerSet == true)
{
   removeMovieClip(this);
}
else
{
   _root.timerSet = true;
   _root.timerMode = "Any";
   _root.timerFormat = "frames";
   frames = 0;
   switchMode = false;
   getDisplay = function(frames)
   {
      switch(_root.timerFormat)
      {
         case "frames":
            var _loc3_ = frames;
            break;
         case "hmsms":
            var _loc4_ = frames / 32;
            var _loc5_ = Math.floor(_loc4_ / (60 * 60));
            var _loc6_ = Math.floor(_loc4_ / 60) % 60;
            var _loc7_ = Math.floor(_loc4_) % 60;
            var _loc8_ = Math.floor(_loc4_ * 1000) % 1000;
            if(_loc6_ < 10)
            {
               _loc6_ = "0" + _loc6_;
            }
            if(_loc7_ < 10)
            {
               _loc7_ = "0" + _loc7_;
            }
            if(_loc8_ < 10)
            {
               _loc8_ = "00" + _loc8_;
            }
            else if(_loc8_ < 100)
            {
               _loc8_ = "0" + _loc8_;
            }
            _loc3_ = _loc5_ + ":" + _loc6_ + ":" + _loc7_ + "." + _loc8_;
            break;
         case "smpte":
            _loc4_ = frames / 32;
            _loc5_ = Math.floor(_loc4_ / (60 * 60));
            _loc6_ = Math.floor(_loc4_ / 60) % 60;
            _loc7_ = Math.floor(_loc4_) % 60;
            _loc8_ = frames % 32;
            if(_loc6_ < 10)
            {
               _loc6_ = "0" + _loc6_;
            }
            if(_loc7_ < 10)
            {
               _loc7_ = "0" + _loc7_;
            }
            if(_loc8_ < 10)
            {
               _loc8_ = "0" + _loc8_;
            }
            _loc3_ = _loc5_ + ":" + _loc6_ + ":" + _loc7_ + "." + _loc8_;
      }
      return _loc3_;
   };
   onEnterFrame = function()
   {
      if(Key.isDown(9))
      {
         if(!switchMode)
         {
            switchMode = true;
            if(Key.isDown(16))
            {
               switch(_root.timerFormat)
               {
                  case "frames":
                     _root.timerFormat = "hmsms";
                     break;
                  case "hmsms":
                     _root.timerFormat = "smpte";
                     break;
                  case "smpte":
                     _root.timerFormat = "frames";
               }
            }
            if(Key.isDown(17))
            {
               switch(_root.timerMode)
               {
                  case "Any":
                     _root.timerMode = "100%";
                     break;
                  case "100%":
                     _root.timerMode = "ASC";
                     break;
                  case "ASC":
                     _root.timerMode = "Any";
               }
            }
         }
      }
      else
      {
         switchMode = false;
      }
      if((_root.timerMode == "100%" && _root.TotalStars == 64 && _root.BowserKey1 == true && _root.BowserKey2 == true && _root.BowserKey3 == true || _root.timerMode == "ASC") && _root.TotalStarCoins == 64)
      {
         _root.timerRunning = false;
      }
      if(Key.isDown(188))
      {
         frames = 0;
         _root.timerRunning = false;
      }
      if(Key.isDown(190))
      {
         _root.timerRunning = !_root.timerRunning;
      }
      this.swapDepths(0);
      this.swapDepths(_root.getNextHighestDepth());
      if(_root.timerRunning)
      {
         frames += 1;
      }
      _root.timerText = "\n\n" + getDisplay(frames) + "\n" + _root.timerMode;
   };
}
