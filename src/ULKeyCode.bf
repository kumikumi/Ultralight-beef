using System;

namespace Ultralight
{
	static
	{
		[AllowDuplicates]
		public enum ULKeyCode : int32
		{
			GK_BACK = 0x08,
			
			GK_TAB = 0x09,
			
			GK_CLEAR = 0x0C,
			
			GK_RETURN = 0x0D,
			
			GK_SHIFT = 0x10,
			
			GK_CONTROL = 0x11,
			
			GK_MENU = 0x12,
			
			GK_PAUSE = 0x13,
			
			GK_CAPITAL = 0x14,
			
			GK_KANA = 0x15,
			
			GK_HANGUL = 0x15,
			
			GK_JUNJA = 0x17,
			
			GK_FINAL = 0x18,
			
			GK_HANJA = 0x19,
			
			GK_KANJI = 0x19,
			
			GK_ESCAPE = 0x1B,
			
			GK_CONVERT = 0x1C,
			
			GK_NONCONVERT = 0x1D,
			
			GK_ACCEPT = 0x1E,
			
			GK_MODECHANGE = 0x1F,
			
			GK_SPACE = 0x20,
			
			GK_PRIOR = 0x21,
			
			GK_NEXT = 0x22,
			
			GK_END = 0x23,
			
			GK_HOME = 0x24,
			
			GK_LEFT = 0x25,
			
			GK_UP = 0x26,
			
			GK_RIGHT = 0x27,
			
			GK_DOWN = 0x28,
			
			GK_SELECT = 0x29,
			
			GK_PRINT = 0x2A,
			
			GK_EXECUTE = 0x2B,
			
			GK_SNAPSHOT = 0x2C,
			
			GK_INSERT = 0x2D,
			
			GK_DELETE = 0x2E,
			
			GK_HELP = 0x2F,
			
			GK_0 = 0x30,
			
			GK_1 = 0x31,
			
			GK_2 = 0x32,
			
			GK_3 = 0x33,
			
			GK_4 = 0x34,
			
			GK_5 = 0x35,
			
			GK_6 = 0x36,
			
			GK_7 = 0x37,
			
			GK_8 = 0x38,
			
			GK_9 = 0x39,
			
			GK_A = 0x41,
			
			GK_B = 0x42,
			
			GK_C = 0x43,
			
			GK_D = 0x44,
			
			GK_E = 0x45,
			
			GK_F = 0x46,
			
			GK_G = 0x47,
			
			GK_H = 0x48,
			
			GK_I = 0x49,
			
			GK_J = 0x4A,
			
			GK_K = 0x4B,
			
			GK_L = 0x4C,
			
			GK_M = 0x4D,
			
			GK_N = 0x4E,
			
			GK_O = 0x4F,
			
			GK_P = 0x50,
			
			GK_Q = 0x51,
			
			GK_R = 0x52,
			
			GK_S = 0x53,
			
			GK_T = 0x54,
			
			GK_U = 0x55,
			
			GK_V = 0x56,
			
			GK_W = 0x57,
			
			GK_X = 0x58,
			
			GK_Y = 0x59,
			
			GK_Z = 0x5A,
			
			GK_LWIN = 0x5B,
			
			GK_RWIN = 0x5C,
			
			GK_APPS = 0x5D,
			
			GK_SLEEP = 0x5F,
			
			GK_NUMPAD0 = 0x60,
			
			GK_NUMPAD1 = 0x61,
			
			GK_NUMPAD2 = 0x62,
			
			GK_NUMPAD3 = 0x63,
			
			GK_NUMPAD4 = 0x64,
			
			GK_NUMPAD5 = 0x65,
			
			GK_NUMPAD6 = 0x66,
			
			GK_NUMPAD7 = 0x67,
			
			GK_NUMPAD8 = 0x68,
			
			GK_NUMPAD9 = 0x69,
			
			GK_MULTIPLY = 0x6A,
			
			GK_ADD = 0x6B,
			
			GK_SEPARATOR = 0x6C,
			
			GK_SUBTRACT = 0x6D,
			
			GK_DECIMAL = 0x6E,
			
			GK_DIVIDE = 0x6F,
			
			GK_F1 = 0x70,
			
			GK_F2 = 0x71,
			
			GK_F3 = 0x72,
			
			GK_F4 = 0x73,
			
			GK_F5 = 0x74,
			
			GK_F6 = 0x75,
			
			GK_F7 = 0x76,
			
			GK_F8 = 0x77,
			
			GK_F9 = 0x78,
			
			GK_F10 = 0x79,
			
			GK_F11 = 0x7A,
			
			GK_F12 = 0x7B,
			
			GK_F13 = 0x7C,
			
			GK_F14 = 0x7D,
			
			GK_F15 = 0x7E,
			
			GK_F16 = 0x7F,
			
			GK_F17 = 0x80,
			
			GK_F18 = 0x81,
			
			GK_F19 = 0x82,
			
			GK_F20 = 0x83,
			
			GK_F21 = 0x84,
			
			GK_F22 = 0x85,
			
			GK_F23 = 0x86,
			
			GK_F24 = 0x87,
			
			GK_NUMLOCK = 0x90,
			
			GK_SCROLL = 0x91,
			
			GK_LSHIFT = 0xA0,
			
			GK_RSHIFT = 0xA1,
			
			GK_LCONTROL = 0xA2,
			
			GK_RCONTROL = 0xA3,
			
			GK_LMENU = 0xA4,
			
			GK_RMENU = 0xA5,
			
			GK_BROWSER_BACK = 0xA6,
			
			GK_BROWSER_FORWARD = 0xA7,
			
			GK_BROWSER_REFRESH = 0xA8,
			
			GK_BROWSER_STOP = 0xA9,
			
			GK_BROWSER_SEARCH = 0xAA,
			
			GK_BROWSER_FAVORITES = 0xAB,
			
			GK_BROWSER_HOME = 0xAC,
			
			GK_VOLUME_MUTE = 0xAD,
			
			GK_VOLUME_DOWN = 0xAE,
			
			GK_VOLUME_UP = 0xAF,
			
			GK_MEDIA_NEXT_TRACK = 0xB0,
			
			GK_MEDIA_PREV_TRACK = 0xB1,
			
			GK_MEDIA_STOP = 0xB2,
			
			GK_MEDIA_PLAY_PAUSE = 0xB3,
			
			GK_MEDIA_LAUNCH_MAIL = 0xB4,
			
			GK_MEDIA_LAUNCH_MEDIA_SELECT = 0xB5,
			
			GK_MEDIA_LAUNCH_APP1 = 0xB6,
			
			GK_MEDIA_LAUNCH_APP2 = 0xB7,
			
			GK_OEM_1 = 0xBA,
			
			GK_OEM_PLUS = 0xBB,
			
			GK_OEM_COMMA = 0xBC,
			
			GK_OEM_MINUS = 0xBD,
			
			GK_OEM_PERIOD = 0xBE,
			
			GK_OEM_2 = 0xBF,
			
			GK_OEM_3 = 0xC0,
			
			GK_OEM_4 = 0xDB,
			
			GK_OEM_5 = 0xDC,
			
			GK_OEM_6 = 0xDD,
			
			GK_OEM_7 = 0xDE,
			
			GK_OEM_8 = 0xDF,
			
			GK_OEM_102 = 0xE2,
			
			GK_PROCESSKEY = 0xE5,
			
			GK_PACKET = 0xE7,
			
			GK_ATTN = 0xF6,
			
			GK_CRSEL = 0xF7,
			
			GK_EXSEL = 0xF8,
			
			GK_EREOF = 0xF9,
			
			GK_PLAY = 0xFA,
			
			GK_ZOOM = 0xFB,
			
			GK_NONAME = 0xFC,
			
			GK_PA1 = 0xFD,
			
			GK_OEM_CLEAR = 0xFE,
			
			GK_UNKNOWN = 0
			
			
		}
	}
}