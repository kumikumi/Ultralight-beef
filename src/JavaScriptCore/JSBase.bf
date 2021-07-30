using System;

namespace ultralight.JavaScriptCore
{
	static
	{
		/*! @typedef JSContextGroupRef A group that associates JavaScript contexts with one another. Contexts in the
		same group may share and exchange JavaScript objects. */
		public struct OpaqueJSContextGroup;
		public typealias JSContextGroupRef = OpaqueJSContextGroup*;

		/*! @typedef JSContextRef A JavaScript execution context. Holds the global object and other execution state. */
		public struct OpaqueJSContext;
		public typealias JSContextRef = OpaqueJSContext*;

		/*! @typedef JSGlobalContextRef A global JavaScript execution context. A JSGlobalContext is a JSContext. */
		public typealias JSGlobalContextRef = OpaqueJSContext*;

		/*! @typedef JSStringRef A UTF16 character buffer. The fundamental string representation in JavaScript. */
		public struct OpaqueJSString;
		public typealias JSStringRef = OpaqueJSString*;

		/*! @typedef JSClassRef A JavaScript class. Used with JSObjectMake to construct objects with custom behavior. */
		public struct OpaqueJSClass;
		public typealias JSClassRef = OpaqueJSClass*;

		/*! @typedef JSPropertyNameArrayRef An array of JavaScript property names. */
		public struct OpaqueJSPropertyNameArray;
		public typealias JSPropertyNameArrayRef = OpaqueJSPropertyNameArray*;

		/*! @typedef JSPropertyNameAccumulatorRef An ordered set used to collect the names of a JavaScript object's
		properties. */
		public struct OpaqueJSPropertyNameAccumulator;
		public typealias JSPropertyNameAccumulatorRef = OpaqueJSPropertyNameAccumulator*;

		/*! @typedef JSTypedArrayBytesDeallocator A function used to deallocate bytes passed to a Typed Array
		constructor. The function should take two arguments. The first is a pointer to the bytes that were originally
		passed to the Typed Array constructor. The second is a pointer to additional information desired at the time the
		bytes are to be freed. */
		public typealias JSTypedArrayBytesDeallocator = function void(void* bytes, void* deallocatorContext);

		/* JavaScript data types */

		/*! @typedef JSValueRef A JavaScript value. The base type for all JavaScript values, and polymorphic functions
		on them. */
		public struct OpaqueJSValue;
		public typealias JSValueRef = OpaqueJSValue*;

		/*! @typedef JSObjectRef A JavaScript object. A JSObject is a JSValue. */
		public typealias JSObjectRef = OpaqueJSValue*;
		//typedef struct OpaqueJSValue* JSObjectRef;

		/* Script Evaluation */

		/*!
		@function JSEvaluateScript
		@abstract Evaluates a string of JavaScript.
		@param ctx The execution context to use.
		@param script A JSString containing the script to evaluate.
		@param thisObject The object to use as "this," or NULL to use the global object as "this."
		@param sourceURL A JSString containing a URL for the script's source file. This is used by debuggers and when
		reporting exceptions. Pass NULL if you do not care to include source file information. @param startingLineNumber
		An integer value specifying the script's starting line number in the file located at sourceURL. This is only
		used when reporting exceptions. The value is one-based, so the first line is line 1 and invalid values are
		clamped to 1. @param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if
		you do not care to store an exception. @result The JSValue that results from evaluating script, or NULL if an
		exception is thrown.
		*/
		[CLink]
		public static extern JSValueRef JSEvaluateScript(JSContextRef ctx, JSStringRef script, JSObjectRef thisObject, JSStringRef sourceURL, int startingLineNumber, JSValueRef* exception);

		/*!
		@function JSCheckScriptSyntax
		@abstract Checks for syntax errors in a string of JavaScript.
		@param ctx The execution context to use.
		@param script A JSString containing the script to check for syntax errors.
		@param sourceURL A JSString containing a URL for the script's source file. This is only used when reporting
		exceptions. Pass NULL if you do not care to include source file information in exceptions. @param
		startingLineNumber An integer value specifying the script's starting line number in the file located at
		sourceURL. This is only used when reporting exceptions. The value is one-based, so the first line is line 1 and
		invalid values are clamped to 1. @param exception A pointer to a JSValueRef in which to store a syntax error
		exception, if any. Pass NULL if you do not care to store a syntax error exception. @result true if the script is
		syntactically correct, otherwise false.
		*/
		[CLink]
		public static extern bool JSCheckScriptSyntax(JSContextRef ctx, JSStringRef script, JSStringRef sourceURL, int startingLineNumber, JSValueRef* exception);

		/*!
		@function JSGarbageCollect
		@abstract Performs a JavaScript garbage collection.
		@param ctx The execution context to use.
		@discussion JavaScript values that are on the machine stack, in a register,
		 protected by JSValueProtect, set as the global object of an execution context,
		 or reachable from any such value will not be collected.
		 During JavaScript execution, you are not required to call this function; the
		 JavaScript engine will garbage collect as needed. JavaScript values created
		 within a context group are automatically destroyed when the last reference
		 to the context group is released.
		*/
		[CLink]
		public static extern void JSGarbageCollect(JSContextRef ctx);
	}
}
