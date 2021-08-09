using System;

namespace Ultralight.CAPI
{
	static
	{
		/*!
		@typedef JSChar
		@abstract A UTF-16 code unit. One, or a sequence of two, can encode any Unicode
		character. As with all scalar types, endianness depends on the underlying
		architecture.
		*/
		
		public typealias JSChar = uint16;
		/*!
		@function
		@abstract         Creates a JavaScript string from a buffer of Unicode characters.
		@param chars      The buffer of Unicode characters to copy into the new JSString.
		@param numChars   The number of characters to copy from the buffer pointed to by chars.
		@result           A JSString containing chars. Ownership follows the Create Rule.
		*/
		
		[CLink]
		public static extern JSStringRef JSStringCreateWithCharacters(JSChar* chars, uint32 numChars);
		
		/*!
		@function
		@abstract         Creates a JavaScript string from a null-terminated UTF8 string.
		@param string     The null-terminated UTF8 string to copy into the new JSString.
		@result           A JSString containing string. Ownership follows the Create Rule.
		*/
		
		[CLink]
		public static extern JSStringRef JSStringCreateWithUTF8CString(char8* string);
		
		/*!
		@function
		@abstract         Retains a JavaScript string.
		@param string     The JSString to retain.
		@result           A JSString that is the same as string.
		*/
		
		[CLink]
		public static extern JSStringRef JSStringRetain(JSStringRef string);
		
		/*!
		@function
		@abstract         Releases a JavaScript string.
		@param string     The JSString to release.
		*/
		
		[CLink]
		public static extern void JSStringRelease(JSStringRef string);
		
		/*!
		@function
		@abstract         Returns the number of Unicode characters in a JavaScript string.
		@param string     The JSString whose length (in Unicode characters) you want to know.
		@result           The number of Unicode characters stored in string.
		*/
		
		[CLink]
		public static extern uint32 JSStringGetLength(JSStringRef string);
		
		/*!
		@function
		@abstract         Returns a pointer to the Unicode character buffer that
		serves as the backing store for a JavaScript string.
		@param string     The JSString whose backing store you want to access.
		@result           A pointer to the Unicode character buffer that serves as string's
		backing store, which will be deallocated when string is deallocated.
		*/
		
		[CLink]
		public static extern JSChar* JSStringGetCharactersPtr(JSStringRef string);
		
		/*!
		@function
		@abstract Returns the maximum number of bytes a JavaScript string will
		take up if converted into a null-terminated UTF8 string.
		@param string The JSString whose maximum converted size (in bytes) you
		want to know.
		@result The maximum number of bytes that could be required to convert string into a
		null-terminated UTF8 string. The number of bytes that the conversion actually ends
		up requiring could be less than this, but never more.
		*/
		
		[CLink]
		public static extern uint32 JSStringGetMaximumUTF8CStringSize(JSStringRef string);
		
		/*!
		@function
		@abstract Converts a JavaScript string into a null-terminated UTF8 string,
		and copies the result into an external byte buffer.
		@param string The source JSString.
		@param buffer The destination byte buffer into which to copy a null-terminated
		UTF8 representation of string. On return, buffer contains a UTF8 string
		representation of string. If bufferSize is too small, buffer will contain only
		partial results. If buffer is not at least bufferSize bytes in size,
		behavior is undefined.
		@param bufferSize The size of the external buffer in bytes.
		@result The number of bytes written into buffer (including the null-terminator byte).
		*/
		
		[CLink]
		public static extern uint32 JSStringGetUTF8CString(JSStringRef string, char8* buffer, uint32 bufferSize);
		
		/*!
		@function
		@abstract     Tests whether two JavaScript strings match.
		@param a      The first JSString to test.
		@param b      The second JSString to test.
		@result       true if the two strings match, otherwise false.
		*/
		
		[CLink]
		public static extern bool JSStringIsEqual(JSStringRef a, JSStringRef b);
		
		/*!
		@function
		@abstract     Tests whether a JavaScript string matches a null-terminated UTF8 string.
		@param a      The JSString to test.
		@param b      The null-terminated UTF8 string to test.
		@result       true if the two strings match, otherwise false.
		*/
		
		[CLink]
		public static extern bool JSStringIsEqualToUTF8CString(JSStringRef a, char8* b);
	}
}
