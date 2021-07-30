using System;

namespace ultralight.JavaScriptCore
{
	static
	{

		/*!
		 @function
		 @abstract Sets a private property on an object.  This private property cannot be accessed from within
		JavaScript. @param ctx The execution context to use. @param object The JSObject whose private property you want
		to set. @param propertyName A JSString containing the property's name. @param value A JSValue to use as the
		property's value.  This may be NULL. @result true if object can store private data, otherwise false. @discussion
		This API allows you to store JS values directly an object in a way that will be ensure that they are kept alive
		without exposing them to JavaScript code and without introducing the reference cycles that may occur when using
		JSValueProtect. The default object class does not allocate storage for private data. Only objects created with a
		non-NULL JSClass can store private properties.
		 */
		[CLink]
		public static extern bool JSObjectSetPrivateProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value);

		/*!
		 @function
		 @abstract Gets a private property from an object.
		 @param ctx The execution context to use.
		 @param object The JSObject whose private property you want to get.
		 @param propertyName A JSString containing the property's name.
		 @result The property's value if object has the property, otherwise NULL.
		 */
		[CLink]
		public static extern JSValueRef JSObjectGetPrivateProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName);

		/*!
		 @function
		 @abstract Deletes a private property from an object.
		 @param ctx The execution context to use.
		 @param object The JSObject whose private property you want to delete.
		 @param propertyName A JSString containing the property's name.
		 @result true if object can store private data, otherwise false.
		 @discussion The default object class does not allocate storage for private data. Only objects created with a
		non-NULL JSClass can store private data.
		 */
		[CLink]
		public static extern bool JSObjectDeletePrivateProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName);

		[CLink]
		public static extern JSObjectRef JSObjectGetProxyTarget(JSObjectRef object);

		[CLink]
		public static extern JSGlobalContextRef JSObjectGetGlobalContext(JSObjectRef object);
	}
}
