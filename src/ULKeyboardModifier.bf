using System;

namespace Ultralight
{
	static
	{
		public enum ULKeyboardModifier : uint8
		{
			// Whether or not an ALT key is down
			kMod_AltKey = 1 << 0,

			// Whether or not a Control key is down
			kMod_CtrlKey = 1 << 1,

			// Whether or not a meta key (Command-key on Mac, Windows-key on Win) is down
			kMod_MetaKey = 1 << 2,

			// Whether or not a Shift key is down
			kMod_ShiftKey = 1 << 3,
		};
	}
}