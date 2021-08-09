using System;

namespace Ultralight.CAPI
{
	static
	{
		/*!
		@enum JSPropertyAttribute
		@constant kJSPropertyAttributeNone         Specifies that a property has no special attributes.
		@constant kJSPropertyAttributeReadOnly     Specifies that a property is read-only.
		@constant kJSPropertyAttributeDontEnum     Specifies that a property should not be enumerated by JSPropertyEnumerators and JavaScript for...in loops.
		@constant kJSPropertyAttributeDontDelete   Specifies that the delete operation should fail on a property.
		*/
		
		public enum JSPropertyAttribute : int32
		{
			kJSPropertyAttributeNone = 0,
			kJSPropertyAttributeReadOnly = 1<<1,
			kJSPropertyAttributeDontEnum = 1<<2,
			kJSPropertyAttributeDontDelete = 1<<3
		};
		
		/*!
		@typedef JSPropertyAttributes
		@abstract A set of JSPropertyAttributes. Combine multiple attributes by logically ORing them together.
		*/
		
		public typealias JSPropertyAttributes = uint32;
		/*!
		@enum JSClassAttribute
		@constant kJSClassAttributeNone Specifies that a class has no special attributes.
		@constant kJSClassAttributeNoAutomaticPrototype Specifies that a class should not automatically generate a shared prototype for its instance objects. Use kJSClassAttributeNoAutomaticPrototype in combination with JSObjectSetPrototype to manage prototypes manually.
		*/
		
		public enum JSClassAttribute : int32
		{
			kJSClassAttributeNone = 0,
			kJSClassAttributeNoAutomaticPrototype = 1<<1
		};
		
		/*!
		@typedef JSClassAttributes
		@abstract A set of JSClassAttributes. Combine multiple attributes by logically ORing them together.
		*/
		
		public typealias JSClassAttributes = uint32;
		/*!
		@typedef JSObjectInitializeCallback
		@abstract The callback invoked when an object is first created.
		@param ctx The execution context to use.
		@param object The JSObject being created.
		@discussion If you named your function Initialize, you would declare it like this:
		void Initialize(JSContextRef ctx, JSObjectRef object);
		Unlike the other object callbacks, the initialize callback is called on the least
		derived class (the parent class) first, and the most derived class last.
		*/
		
		public typealias JSObjectInitializeCallback = function void(JSContextRef ctx, JSObjectRef object);
		
		/* Extension of the above callback with the class that the method is being invoked for. */
		
		public typealias JSObjectInitializeCallbackEx = function void(JSContextRef ctx, JSClassRef jsClass, JSObjectRef object);
		
		/*!
		@typedef JSObjectFinalizeCallback
		@abstract The callback invoked when an object is finalized (prepared for garbage collection). An object may be finalized on any thread.
		@param object The JSObject being finalized.
		@discussion If you named your function Finalize, you would declare it like this:
		void Finalize(JSObjectRef object);
		The finalize callback is called on the most derived class first, and the least
		derived class (the parent class) last.
		You must not call any function that may cause a garbage collection or an allocation
		of a garbage collected object from within a JSObjectFinalizeCallback. This includes
		all functions that have a JSContextRef parameter.
		*/
		
		public typealias JSObjectFinalizeCallback = function void(JSObjectRef object);
		
		/* Extension of the above callback with the class that the method is being invoked for. */
		
		public typealias JSObjectFinalizeCallbackEx = function void(JSClassRef jsClass, JSObjectRef object);
		
		/*!
		@typedef JSObjectHasPropertyCallback
		@abstract The callback invoked when determining whether an object has a property.
		@param ctx The execution context to use.
		@param object The JSObject to search for the property.
		@param propertyName A JSString containing the name of the property look up.
		@result true if object has the property, otherwise false.
		@discussion If you named your function HasProperty, you would declare it like this:
		bool HasProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName);
		If this function returns false, the hasProperty request forwards to object's statically declared properties, then its parent class chain (which includes the default object class), then its prototype chain.
		This callback enables optimization in cases where only a property's existence needs to be known, not its value, and computing its value would be expensive.
		If this callback is NULL, the getProperty callback will be used to service hasProperty requests.
		*/
		
		public typealias JSObjectHasPropertyCallback = function bool(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName);
		
		/* Extension of the above callback with the class that the method is being invoked for. */
		
		public typealias JSObjectHasPropertyCallbackEx = function bool(JSContextRef ctx, JSClassRef jsClass, JSObjectRef object, JSStringRef propertyName);
		
		/*!
		@typedef JSObjectGetPropertyCallback
		@abstract The callback invoked when getting a property's value.
		@param ctx The execution context to use.
		@param object The JSObject to search for the property.
		@param propertyName A JSString containing the name of the property to get.
		@param exception A pointer to a JSValueRef in which to return an exception, if any.
		@result The property's value if object has the property, otherwise NULL.
		@discussion If you named your function GetProperty, you would declare it like this:
		JSValueRef GetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef* exception);
		If this function returns NULL, the get request forwards to object's statically declared properties, then its parent class chain (which includes the default object class), then its prototype chain.
		*/
		
		public typealias JSObjectGetPropertyCallback = function JSValueRef(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef* exception);
		
		/* Extension of the above callback with the class that the method is being invoked for. */
		
		public typealias JSObjectGetPropertyCallbackEx = function JSValueRef(JSContextRef ctx, JSClassRef jsClass, JSObjectRef object, JSStringRef propertyName, JSValueRef* exception);
		
		/*!
		@typedef JSObjectSetPropertyCallback
		@abstract The callback invoked when setting a property's value.
		@param ctx The execution context to use.
		@param object The JSObject on which to set the property's value.
		@param propertyName A JSString containing the name of the property to set.
		@param value A JSValue to use as the property's value.
		@param exception A pointer to a JSValueRef in which to return an exception, if any.
		@result true if the property was set, otherwise false.
		@discussion If you named your function SetProperty, you would declare it like this:
		bool SetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSValueRef* exception);
		If this function returns false, the set request forwards to object's statically declared properties, then its parent class chain (which includes the default object class).
		*/
		
		public typealias JSObjectSetPropertyCallback = function bool(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSValueRef* exception);
		
		/* Extension of the above callback with the class that the method is being invoked for. */
		
		public typealias JSObjectSetPropertyCallbackEx = function bool(JSContextRef ctx, JSClassRef jsClass, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSValueRef* exception);
		
		/*!
		@typedef JSObjectDeletePropertyCallback
		@abstract The callback invoked when deleting a property.
		@param ctx The execution context to use.
		@param object The JSObject in which to delete the property.
		@param propertyName A JSString containing the name of the property to delete.
		@param exception A pointer to a JSValueRef in which to return an exception, if any.
		@result true if propertyName was successfully deleted, otherwise false.
		@discussion If you named your function DeleteProperty, you would declare it like this:
		bool DeleteProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef* exception);
		If this function returns false, the delete request forwards to object's statically declared properties, then its parent class chain (which includes the default object class).
		*/
		
		public typealias JSObjectDeletePropertyCallback = function bool(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef* exception);
		
		/* Extension of the above callback with the class that the method is being invoked for. */
		
		public typealias JSObjectDeletePropertyCallbackEx = function bool(JSContextRef ctx, JSClassRef jsClass, JSObjectRef object, JSStringRef propertyName, JSValueRef* exception);
		
		/*!
		@typedef JSObjectGetPropertyNamesCallback
		@abstract The callback invoked when collecting the names of an object's properties.
		@param ctx The execution context to use.
		@param object The JSObject whose property names are being collected.
		@param propertyNames A JavaScript property name accumulator in which to accumulate the names of object's properties.
		@discussion If you named your function GetPropertyNames, you would declare it like this:
		void GetPropertyNames(JSContextRef ctx, JSObjectRef object, JSPropertyNameAccumulatorRef propertyNames);
		Property name accumulators are used by JSObjectCopyPropertyNames and JavaScript for...in loops.
		Use JSPropertyNameAccumulatorAddName to add property names to accumulator. A class's getPropertyNames callback only needs to provide the names of properties that the class vends through a custom getProperty or setProperty callback. Other properties, including statically declared properties, properties vended by other classes, and properties belonging to object's prototype, are added independently.
		*/
		
		public typealias JSObjectGetPropertyNamesCallback = function void(JSContextRef ctx, JSObjectRef object, JSPropertyNameAccumulatorRef propertyNames);
		
		/* Extension of the above callback with the class that the method is being invoked for. */
		
		public typealias JSObjectGetPropertyNamesCallbackEx = function void(JSContextRef ctx, JSClassRef jsClass, JSObjectRef object, JSPropertyNameAccumulatorRef propertyNames);
		
		/*!
		@typedef JSObjectCallAsFunctionCallback
		@abstract The callback invoked when an object is called as a function.
		@param ctx The execution context to use.
		@param function A JSObject that is the function being called.
		@param thisObject A JSObject that is the 'this' variable in the function's scope.
		@param argumentCount An integer count of the number of arguments in arguments.
		@param arguments A JSValue array of the  arguments passed to the function.
		@param exception A pointer to a JSValueRef in which to return an exception, if any.
		@result A JSValue that is the function's return value.
		@discussion If you named your function CallAsFunction, you would declare it like this:
		JSValueRef CallAsFunction(JSContextRef ctx, JSObjectRef function, JSObjectRef thisObject, size_t argumentCount, const JSValueRef arguments[], JSValueRef* exception);
		If your callback were invoked by the JavaScript expression 'myObject.myFunction()', function would be set to myFunction, and thisObject would be set to myObject.
		If this callback is NULL, calling your object as a function will throw an exception.
		*/
		
		public typealias JSObjectCallAsFunctionCallback = function JSValueRef(JSContextRef ctx, JSObjectRef fn, JSObjectRef thisObject, uint32 argumentCount, JSValueRef* arguments, JSValueRef* exception);
		
		/* Extension of the above callback with the class and class name of the object being called as a function.
		@discussion If this is a JSStaticFunctionEx, className will actually be the name of the function.
		*/
		
		public typealias JSObjectCallAsFunctionCallbackEx = function JSValueRef(JSContextRef ctx, JSClassRef jsClass, JSStringRef className, JSObjectRef fn, JSObjectRef thisObject, uint32 argumentCount, JSValueRef* arguments, JSValueRef* exception);
		
		/*!
		@typedef JSObjectCallAsConstructorCallback
		@abstract The callback invoked when an object is used as a constructor in a 'new' expression.
		@param ctx The execution context to use.
		@param constructor A JSObject that is the constructor being called.
		@param argumentCount An integer count of the number of arguments in arguments.
		@param arguments A JSValue array of the  arguments passed to the function.
		@param exception A pointer to a JSValueRef in which to return an exception, if any.
		@result A JSObject that is the constructor's return value.
		@discussion If you named your function CallAsConstructor, you would declare it like this:
		JSObjectRef CallAsConstructor(JSContextRef ctx, JSObjectRef constructor, size_t argumentCount, const JSValueRef arguments[], JSValueRef* exception);
		If your callback were invoked by the JavaScript expression 'new myConstructor()', constructor would be set to myConstructor.
		If this callback is NULL, using your object as a constructor in a 'new' expression will throw an exception.
		*/
		
		public typealias JSObjectCallAsConstructorCallback = function JSObjectRef(JSContextRef ctx, JSObjectRef constructor, uint32 argumentCount, JSValueRef* arguments, JSValueRef* exception);
		
		/* Extension of the above callback with the class that the method is being invoked for. */
		
		public typealias JSObjectCallAsConstructorCallbackEx = function JSObjectRef(JSContextRef ctx, JSClassRef jsClass, JSObjectRef constructor, uint32 argumentCount, JSValueRef* arguments, JSValueRef* exception);
		
		/*!
		@typedef JSObjectHasInstanceCallback
		@abstract hasInstance The callback invoked when an object is used as the target of an 'instanceof' expression.
		@param ctx The execution context to use.
		@param constructor The JSObject that is the target of the 'instanceof' expression.
		@param possibleInstance The JSValue being tested to determine if it is an instance of constructor.
		@param exception A pointer to a JSValueRef in which to return an exception, if any.
		@result true if possibleInstance is an instance of constructor, otherwise false.
		@discussion If you named your function HasInstance, you would declare it like this:
		bool HasInstance(JSContextRef ctx, JSObjectRef constructor, JSValueRef possibleInstance, JSValueRef* exception);
		If your callback were invoked by the JavaScript expression 'someValue instanceof myObject', constructor would be set to myObject and possibleInstance would be set to someValue.
		If this callback is NULL, 'instanceof' expressions that target your object will return false.
		Standard JavaScript practice calls for objects that implement the callAsConstructor callback to implement the hasInstance callback as well.
		*/
		
		public typealias JSObjectHasInstanceCallback = function bool(JSContextRef ctx, JSObjectRef constructor, JSValueRef possibleInstance, JSValueRef* exception);
		
		/* Extension of the above callback with the class that the method is being invoked for. */
		
		public typealias JSObjectHasInstanceCallbackEx = function bool(JSContextRef ctx, JSClassRef jsClass, JSObjectRef constructor, JSValueRef possibleInstance, JSValueRef* exception);
		
		/*!
		@typedef JSObjectConvertToTypeCallback
		@abstract The callback invoked when converting an object to a particular JavaScript type.
		@param ctx The execution context to use.
		@param object The JSObject to convert.
		@param type A JSType specifying the JavaScript type to convert to.
		@param exception A pointer to a JSValueRef in which to return an exception, if any.
		@result The objects's converted value, or NULL if the object was not converted.
		@discussion If you named your function ConvertToType, you would declare it like this:
		JSValueRef ConvertToType(JSContextRef ctx, JSObjectRef object, JSType type, JSValueRef* exception);
		If this function returns false, the conversion request forwards to object's parent class chain (which includes the default object class).
		This function is only invoked when converting an object to number or string. An object converted to boolean is 'true.' An object converted to object is itself.
		*/
		
		public typealias JSObjectConvertToTypeCallback = function JSValueRef(JSContextRef ctx, JSObjectRef object, JSType type, JSValueRef* exception);
		
		/* Extension of the above callback with the class that the method is being invoked for. */
		
		public typealias JSObjectConvertToTypeCallbackEx = function JSValueRef(JSContextRef ctx, JSClassRef jsClass, JSObjectRef object, JSType type, JSValueRef* exception);
		
		/*!
		@struct JSStaticValue
		@abstract This structure describes a statically declared value property.
		@field name A null-terminated UTF8 string containing the property's name.
		@field getProperty A JSObjectGetPropertyCallback to invoke when getting the property's value.
		@field setProperty A JSObjectSetPropertyCallback to invoke when setting the property's value. May be NULL if the ReadOnly attribute is set.
		@field attributes A logically ORed set of JSPropertyAttributes to give to the property.
		*/
		
		[CRepr]
		public struct JSStaticValue
		{
			public char8* name;
			public JSObjectGetPropertyCallback getProperty;
			public JSObjectSetPropertyCallback setProperty;
			public JSPropertyAttributes attributes;
		};
		
		/* Extension of the above structure for use with class version 1000 */
		
		[CRepr]
		public struct JSStaticValueEx
		{
			public char8* name;
			public JSObjectGetPropertyCallbackEx getPropertyEx;
			public JSObjectSetPropertyCallbackEx setPropertyEx;
			public JSPropertyAttributes attributes;
		};
		
		/*!
		@struct JSStaticFunction
		@abstract This structure describes a statically declared function property.
		@field name A null-terminated UTF8 string containing the property's name.
		@field callAsFunction A JSObjectCallAsFunctionCallback to invoke when the property is called as a function.
		@field attributes A logically ORed set of JSPropertyAttributes to give to the property.
		*/
		
		[CRepr]
		public struct JSStaticFunction
		{
			public char8* name;
			public JSObjectCallAsFunctionCallback callAsFunction;
			public JSPropertyAttributes attributes;
		};
		
		/* Extension of the above structure for use with class version 1000 */
		
		[CRepr]
		public struct JSStaticFunctionEx
		{
			public char8* name;
			public JSObjectCallAsFunctionCallbackEx callAsFunctionEx;
			public JSPropertyAttributes attributes;
		};
		
		/*!
		@struct JSClassDefinition
		@abstract This structure contains properties and callbacks that define a type of object. All fields other than the version field are optional. Any pointer may be NULL.
		@field version The version number of this structure. The current version is 0.
		@field attributes A logically ORed set of JSClassAttributes to give to the class.
		@field className A null-terminated UTF8 string containing the class's name.
		@field parentClass A JSClass to set as the class's parent class. Pass NULL use the default object class.
		@field staticValues A JSStaticValue array containing the class's statically declared value properties. Pass NULL to specify no statically declared value properties. The array must be terminated by a JSStaticValue whose name field is NULL.
		@field staticFunctions A JSStaticFunction array containing the class's statically declared function properties. Pass NULL to specify no statically declared function properties. The array must be terminated by a JSStaticFunction whose name field is NULL.
		@field initialize The callback invoked when an object is first created. Use this callback to initialize the object.
		@field finalize The callback invoked when an object is finalized (prepared for garbage collection). Use this callback to release resources allocated for the object, and perform other cleanup.
		@field hasProperty The callback invoked when determining whether an object has a property. If this field is NULL, getProperty is called instead. The hasProperty callback enables optimization in cases where only a property's existence needs to be known, not its value, and computing its value is expensive.
		@field getProperty The callback invoked when getting a property's value.
		@field setProperty The callback invoked when setting a property's value.
		@field deleteProperty The callback invoked when deleting a property.
		@field getPropertyNames The callback invoked when collecting the names of an object's properties.
		@field callAsFunction The callback invoked when an object is called as a function.
		@field hasInstance The callback invoked when an object is used as the target of an 'instanceof' expression.
		@field callAsConstructor The callback invoked when an object is used as a constructor in a 'new' expression.
		@field convertToType The callback invoked when converting an object to a particular JavaScript type.
		@discussion The staticValues and staticFunctions arrays are the simplest and most efficient means for vending custom properties. Statically declared properties autmatically service requests like getProperty, setProperty, and getPropertyNames. Property access callbacks are required only to implement unusual properties, like array indexes, whose names are not known at compile-time.
		If you named your getter function "GetX" and your setter function "SetX", you would declare a JSStaticValue array containing "X" like this:
		JSStaticValue StaticValueArray[] = {
		{ "X", GetX, SetX, kJSPropertyAttributeNone },
		{ 0, 0, 0, 0 }
		};
		Standard JavaScript practice calls for storing function objects in prototypes, so they can be shared. The default JSClass created by JSClassCreate follows this idiom, instantiating objects with a shared, automatically generating prototype containing the class's function objects. The kJSClassAttributeNoAutomaticPrototype attribute specifies that a JSClass should not automatically generate such a prototype. The resulting JSClass instantiates objects with the default object prototype, and gives each instance object its own copy of the class's function objects.
		A NULL callback specifies that the default object callback should substitute, except in the case of hasProperty, where it specifies that getProperty should substitute.
		*/
		
		[CRepr]
		public struct JSClassDefinitionVersion0
		{
			public int version;
			public JSClassAttributes attributes;
			public char8* className;
			public JSClassRef parentClass;
		
			/* version 0 */
			public readonly JSStaticValue* staticValues;
			public readonly JSStaticFunction* staticFunctions;
			public JSObjectInitializeCallback initialize;
			public JSObjectFinalizeCallback finalize;
			public JSObjectHasPropertyCallback hasProperty;
			public JSObjectGetPropertyCallback getProperty;
			public JSObjectSetPropertyCallback setProperty;
			public JSObjectDeletePropertyCallback deleteProperty;
			public JSObjectGetPropertyNamesCallback getPropertyNames;
			public JSObjectCallAsFunctionCallback callAsFunction;
			public JSObjectCallAsConstructorCallback callAsConstructor;
			public JSObjectHasInstanceCallback hasInstance;
			public JSObjectConvertToTypeCallback convertToType;
		
			//public void* privateData;/* version 1000 only */
		};
		
		[CRepr]
		public struct JSClassDefinitionVersion1000
		{
			public int version;
			public JSClassAttributes attributes;
			public char8* className;
			public JSClassRef parentClass;
		
			/* version 1000 */
			public readonly JSStaticValueEx* staticValuesEx;
			public readonly JSStaticFunctionEx* staticFunctionsEx;
			public JSObjectInitializeCallbackEx initializeEx;
			public JSObjectFinalizeCallbackEx finalizeEx;
			public JSObjectHasPropertyCallbackEx hasPropertyEx;
			public JSObjectGetPropertyCallbackEx getPropertyEx;
			public JSObjectSetPropertyCallbackEx setPropertyEx;
			public JSObjectDeletePropertyCallbackEx deletePropertyEx;
			public JSObjectGetPropertyNamesCallbackEx getPropertyNamesEx;
			public JSObjectCallAsFunctionCallbackEx callAsFunctionEx;
			public JSObjectCallAsConstructorCallbackEx callAsConstructorEx;
			public JSObjectHasInstanceCallbackEx hasInstanceEx;
			public JSObjectConvertToTypeCallbackEx convertToTypeEx;
		
			public void* privateData;/* version 1000 only */
		};
		
		[CRepr, Union]
		public struct JSClassDefinition
		{
			public JSClassDefinitionVersion0 version0;
			public JSClassDefinitionVersion1000 version1000;
		};
		
		/*!
		@const kJSClassDefinitionEmpty
		@abstract A JSClassDefinition structure of the current version, filled with NULL pointers and having no attributes.
		@discussion Use this constant as a convenience when creating class definitions. For example, to create a class definition with only a finalize method:
		JSClassDefinition definition = kJSClassDefinitionEmpty;
		definition.finalize = Finalize;
		*/
		
		// FIXME
		//JS_EXPORT extern const JSClassDefinition kJSClassDefinitionEmpty 
		/*!
		@function
		@abstract Creates a JavaScript class suitable for use with JSObjectMake.
		@param definition A JSClassDefinition that defines the class.
		@result A JSClass with the given definition. Ownership follows the Create Rule.
		*/
		
		[CLink]
		public static extern JSClassRef JSClassCreate(JSClassDefinition* definition);
		
		/*!
		@function
		@abstract Retains a JavaScript class.
		@param jsClass The JSClass to retain.
		@result A JSClass that is the same as jsClass.
		*/
		
		[CLink]
		public static extern JSClassRef JSClassRetain(JSClassRef jsClass);
		
		/*!
		@function
		@abstract Releases a JavaScript class.
		@param jsClass The JSClass to release.
		*/
		
		[CLink]
		public static extern void JSClassRelease(JSClassRef jsClass);
		
		/*!
		@function
		@abstract Retrieves the private data from a class reference, only possible with classes created with version 1000 (extended callbacks).
		@param jsClass The class to get the data from
		@result The private data on the class, or NULL, if not set
		@discussion Only classes with version 1000 (extended callbacks) can store private data, for other classes always NULL will always be returned.
		*/
		
		[CLink]
		public static extern void* JSClassGetPrivate(JSClassRef jsClass);
		
		/*!
		@function
		@abstract Sets the private data on a class, only possible with classes created with version 1000 (extended callbacks).
		@param jsClass The class to set the data on
		@param data A void* to set as the private data for the class
		@result true if the data has been set on the class, false if the class has not been created with version 1000 (extended callbacks)
		@discussion Only classes with version 1000 (extended callbacks) can store private data, for other classes the function always fails. The set pointer is not touched by the engine.
		*/
		
		[CLink]
		public static extern bool JSClassSetPrivate(JSClassRef jsClass, void* data);
		
		/*!
		@function
		@abstract Creates a JavaScript object.
		@param ctx The execution context to use.
		@param jsClass The JSClass to assign to the object. Pass NULL to use the default object class.
		@param data A void* to set as the object's private data. Pass NULL to specify no private data.
		@result A JSObject with the given class and private data.
		@discussion The default object class does not allocate storage for private data, so you must provide a non-NULL jsClass to JSObjectMake if you want your object to be able to store private data.
		data is set on the created object before the intialize methods in its class chain are called. This enables the initialize methods to retrieve and manipulate data through JSObjectGetPrivate.
		*/
		
		[CLink]
		public static extern JSObjectRef JSObjectMake(JSContextRef ctx, JSClassRef jsClass, void* data);
		
		/*!
		@function
		@abstract Convenience method for creating a JavaScript function with a given callback as its implementation.
		@param ctx The execution context to use.
		@param name A JSString containing the function's name. This will be used when converting the function to string. Pass NULL to create an anonymous function.
		@param callAsFunction The JSObjectCallAsFunctionCallback to invoke when the function is called.
		@result A JSObject that is a function. The object's prototype will be the default function prototype.
		*/
		
		[CLink]
		public static extern JSObjectRef JSObjectMakeFunctionWithCallback(JSContextRef ctx, JSStringRef name, JSObjectCallAsFunctionCallback callAsFunction);
		
		/*!
		@function
		@abstract Convenience method for creating a JavaScript constructor.
		@param ctx The execution context to use.
		@param jsClass A JSClass that is the class your constructor will assign to the objects its constructs. jsClass will be used to set the constructor's .prototype property, and to evaluate 'instanceof' expressions. Pass NULL to use the default object class.
		@param callAsConstructor A JSObjectCallAsConstructorCallback to invoke when your constructor is used in a 'new' expression. Pass NULL to use the default object constructor.
		@result A JSObject that is a constructor. The object's prototype will be the default object prototype.
		@discussion The default object constructor takes no arguments and constructs an object of class jsClass with no private data.
		*/
		
		[CLink]
		public static extern JSObjectRef JSObjectMakeConstructor(JSContextRef ctx, JSClassRef jsClass, JSObjectCallAsConstructorCallback callAsConstructor);
		
		/*!
		@function
		@abstract Creates a JavaScript Array object.
		@param ctx The execution context to use.
		@param argumentCount An integer count of the number of arguments in arguments.
		@param arguments A JSValue array of data to populate the Array with. Pass NULL if argumentCount is 0.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result A JSObject that is an Array.
		@discussion The behavior of this function does not exactly match the behavior of the built-in Array constructor. Specifically, if one argument
		is supplied, this function returns an array with one element.
		*/
		
		[CLink]
		public static extern JSObjectRef JSObjectMakeArray(JSContextRef ctx, uint32 argumentCount, JSValueRef* arguments, JSValueRef* exception);
		
		/*!
		@function
		@abstract Creates a JavaScript Date object, as if by invoking the built-in Date constructor.
		@param ctx The execution context to use.
		@param argumentCount An integer count of the number of arguments in arguments.
		@param arguments A JSValue array of arguments to pass to the Date Constructor. Pass NULL if argumentCount is 0.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result A JSObject that is a Date.
		*/
		
		[CLink]
		public static extern JSObjectRef JSObjectMakeDate(JSContextRef ctx, uint32 argumentCount, JSValueRef* arguments, JSValueRef* exception);
		
		/*!
		@function
		@abstract Creates a JavaScript Error object, as if by invoking the built-in Error constructor.
		@param ctx The execution context to use.
		@param argumentCount An integer count of the number of arguments in arguments.
		@param arguments A JSValue array of arguments to pass to the Error Constructor. Pass NULL if argumentCount is 0.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result A JSObject that is a Error.
		*/
		
		[CLink]
		public static extern JSObjectRef JSObjectMakeError(JSContextRef ctx, uint32 argumentCount, JSValueRef* arguments, JSValueRef* exception);
		
		/*!
		@function
		@abstract Creates a JavaScript RegExp object, as if by invoking the built-in RegExp constructor.
		@param ctx The execution context to use.
		@param argumentCount An integer count of the number of arguments in arguments.
		@param arguments A JSValue array of arguments to pass to the RegExp Constructor. Pass NULL if argumentCount is 0.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result A JSObject that is a RegExp.
		*/
		
		[CLink]
		public static extern JSObjectRef JSObjectMakeRegExp(JSContextRef ctx, uint32 argumentCount, JSValueRef* arguments, JSValueRef* exception);
		
		/*!
		@function
		@abstract Creates a JavaScript promise object by invoking the provided executor.
		@param ctx The execution context to use.
		@param resolve A pointer to a JSObjectRef in which to store the resolve function for the new promise. Pass NULL if you do not care to store the resolve callback.
		@param reject A pointer to a JSObjectRef in which to store the reject function for the new promise. Pass NULL if you do not care to store the reject callback.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result A JSObject that is a promise or NULL if an exception occurred.
		*/
		
		[CLink]
		public static extern JSObjectRef JSObjectMakeDeferredPromise(JSContextRef ctx, JSObjectRef* resolve, JSObjectRef* reject, JSValueRef* exception);
		
		/*!
		@function
		@abstract Creates a function with a given script as its body.
		@param ctx The execution context to use.
		@param name A JSString containing the function's name. This will be used when converting the function to string. Pass NULL to create an anonymous function.
		@param parameterCount An integer count of the number of parameter names in parameterNames.
		@param parameterNames A JSString array containing the names of the function's parameters. Pass NULL if parameterCount is 0.
		@param body A JSString containing the script to use as the function's body.
		@param sourceURL A JSString containing a URL for the script's source file. This is only used when reporting exceptions. Pass NULL if you do not care to include source file information in exceptions.
		@param startingLineNumber An integer value specifying the script's starting line number in the file located at sourceURL. This is only used when reporting exceptions. The value is one-based, so the first line is line 1 and invalid values are clamped to 1.
		@param exception A pointer to a JSValueRef in which to store a syntax error exception, if any. Pass NULL if you do not care to store a syntax error exception.
		@result A JSObject that is a function, or NULL if either body or parameterNames contains a syntax error. The object's prototype will be the default function prototype.
		@discussion Use this method when you want to execute a script repeatedly, to avoid the cost of re-parsing the script before each execution.
		*/
		
		[CLink]
		public static extern JSObjectRef JSObjectMakeFunction(JSContextRef ctx, JSStringRef name, uint32 parameterCount, JSStringRef* parameterNames, JSStringRef body, JSStringRef sourceURL, int32 startingLineNumber, JSValueRef* exception);
		
		/*!
		@function
		@abstract Gets an object's prototype.
		@param ctx  The execution context to use.
		@param object A JSObject whose prototype you want to get.
		@result A JSValue that is the object's prototype.
		*/
		
		[CLink]
		public static extern JSValueRef JSObjectGetPrototype(JSContextRef ctx, JSObjectRef object);
		
		/*!
		@function
		@abstract Sets an object's prototype.
		@param ctx  The execution context to use.
		@param object The JSObject whose prototype you want to set.
		@param value A JSValue to set as the object's prototype.
		*/
		
		[CLink]
		public static extern void JSObjectSetPrototype(JSContextRef ctx, JSObjectRef object, JSValueRef value);
		
		/*!
		@function
		@abstract Tests whether an object has a given property.
		@param object The JSObject to test.
		@param propertyName A JSString containing the property's name.
		@result true if the object has a property whose name matches propertyName, otherwise false.
		*/
		
		[CLink]
		public static extern bool JSObjectHasProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName);
		
		/*!
		@function
		@abstract Gets a property from an object.
		@param ctx The execution context to use.
		@param object The JSObject whose property you want to get.
		@param propertyName A JSString containing the property's name.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result The property's value if object has the property, otherwise the undefined value.
		*/
		
		[CLink]
		public static extern JSValueRef JSObjectGetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef* exception);
		
		/*!
		@function
		@abstract Sets a property on an object.
		@param ctx The execution context to use.
		@param object The JSObject whose property you want to set.
		@param propertyName A JSString containing the property's name.
		@param value A JSValueRef to use as the property's value.
		@param attributes A logically ORed set of JSPropertyAttributes to give to the property.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		*/
		
		[CLink]
		public static extern void JSObjectSetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSPropertyAttributes attributes, JSValueRef* exception);
		
		/*!
		@function
		@abstract Deletes a property from an object.
		@param ctx The execution context to use.
		@param object The JSObject whose property you want to delete.
		@param propertyName A JSString containing the property's name.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result true if the delete operation succeeds, otherwise false (for example, if the property has the kJSPropertyAttributeDontDelete attribute set).
		*/
		
		[CLink]
		public static extern bool JSObjectDeleteProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef* exception);
		
		/*!
		@function
		@abstract Tests whether an object has a given property using a JSValueRef as the property key.
		@param object The JSObject to test.
		@param propertyKey A JSValueRef containing the property key to use when looking up the property.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result true if the object has a property whose name matches propertyKey, otherwise false.
		@discussion This function is the same as performing "propertyKey in object" from JavaScript.
		*/
		
		[CLink]
		public static extern bool JSObjectHasPropertyForKey(JSContextRef ctx, JSObjectRef object, JSValueRef propertyKey, JSValueRef* exception);
		
		/*!
		@function
		@abstract Gets a property from an object using a JSValueRef as the property key.
		@param ctx The execution context to use.
		@param object The JSObject whose property you want to get.
		@param propertyKey A JSValueRef containing the property key to use when looking up the property.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result The property's value if object has the property key, otherwise the undefined value.
		@discussion This function is the same as performing "object[propertyKey]" from JavaScript.
		*/
		
		[CLink]
		public static extern JSValueRef JSObjectGetPropertyForKey(JSContextRef ctx, JSObjectRef object, JSValueRef propertyKey, JSValueRef* exception);
		
		/*!
		@function
		@abstract Sets a property on an object using a JSValueRef as the property key.
		@param ctx The execution context to use.
		@param object The JSObject whose property you want to set.
		@param propertyKey A JSValueRef containing the property key to use when looking up the property.
		@param value A JSValueRef to use as the property's value.
		@param attributes A logically ORed set of JSPropertyAttributes to give to the property.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@discussion This function is the same as performing "object[propertyKey] = value" from JavaScript.
		*/
		
		[CLink]
		public static extern void JSObjectSetPropertyForKey(JSContextRef ctx, JSObjectRef object, JSValueRef propertyKey, JSValueRef value, JSPropertyAttributes attributes, JSValueRef* exception);
		
		/*!
		@function
		@abstract Deletes a property from an object using a JSValueRef as the property key.
		@param ctx The execution context to use.
		@param object The JSObject whose property you want to delete.
		@param propertyKey A JSValueRef containing the property key to use when looking up the property.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result true if the delete operation succeeds, otherwise false (for example, if the property has the kJSPropertyAttributeDontDelete attribute set).
		@discussion This function is the same as performing "delete object[propertyKey]" from JavaScript.
		*/
		
		[CLink]
		public static extern bool JSObjectDeletePropertyForKey(JSContextRef ctx, JSObjectRef object, JSValueRef propertyKey, JSValueRef* exception);
		
		/*!
		@function
		@abstract Gets a property from an object by numeric index.
		@param ctx The execution context to use.
		@param object The JSObject whose property you want to get.
		@param propertyIndex An integer value that is the property's name.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result The property's value if object has the property, otherwise the undefined value.
		@discussion Calling JSObjectGetPropertyAtIndex is equivalent to calling JSObjectGetProperty with a string containing propertyIndex, but JSObjectGetPropertyAtIndex provides optimized access to numeric properties.
		*/
		
		[CLink]
		public static extern JSValueRef JSObjectGetPropertyAtIndex(JSContextRef ctx, JSObjectRef object, uint32 propertyIndex, JSValueRef* exception);
		
		/*!
		@function
		@abstract Sets a property on an object by numeric index.
		@param ctx The execution context to use.
		@param object The JSObject whose property you want to set.
		@param propertyIndex The property's name as a number.
		@param value A JSValue to use as the property's value.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@discussion Calling JSObjectSetPropertyAtIndex is equivalent to calling JSObjectSetProperty with a string containing propertyIndex, but JSObjectSetPropertyAtIndex provides optimized access to numeric properties.
		*/
		
		[CLink]
		public static extern void JSObjectSetPropertyAtIndex(JSContextRef ctx, JSObjectRef object, uint32 propertyIndex, JSValueRef value, JSValueRef* exception);
		
		/*!
		@function
		@abstract Gets an object's private data.
		@param object A JSObject whose private data you want to get.
		@result A void* that is the object's private data, if the object has private data, otherwise NULL.
		*/
		
		[CLink]
		public static extern void* JSObjectGetPrivate(JSObjectRef object);
		
		/*!
		@function
		@abstract Sets a pointer to private data on an object.
		@param object The JSObject whose private data you want to set.
		@param data A void* to set as the object's private data.
		@result true if object can store private data, otherwise false.
		@discussion The default object class does not allocate storage for private data. Only objects created with a non-NULL JSClass can store private data.
		*/
		
		[CLink]
		public static extern bool JSObjectSetPrivate(JSObjectRef object, void* data);
		
		/*!
		@function
		@abstract Tests whether an object can be called as a function.
		@param ctx  The execution context to use.
		@param object The JSObject to test.
		@result true if the object can be called as a function, otherwise false.
		*/
		
		[CLink]
		public static extern bool JSObjectIsFunction(JSContextRef ctx, JSObjectRef object);
		
		/*!
		@function
		@abstract Calls an object as a function.
		@param ctx The execution context to use.
		@param object The JSObject to call as a function.
		@param thisObject The object to use as "this," or NULL to use the global object as "this."
		@param argumentCount An integer count of the number of arguments in arguments.
		@param arguments A JSValue array of arguments to pass to the function. Pass NULL if argumentCount is 0.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result The JSValue that results from calling object as a function, or NULL if an exception is thrown or object is not a function.
		*/
		
		[CLink]
		public static extern JSValueRef JSObjectCallAsFunction(JSContextRef ctx, JSObjectRef object, JSObjectRef thisObject, uint32 argumentCount, JSValueRef* arguments, JSValueRef* exception);
		
		/*!
		@function
		@abstract Tests whether an object can be called as a constructor.
		@param ctx  The execution context to use.
		@param object The JSObject to test.
		@result true if the object can be called as a constructor, otherwise false.
		*/
		
		[CLink]
		public static extern bool JSObjectIsConstructor(JSContextRef ctx, JSObjectRef object);
		
		/*!
		@function
		@abstract Calls an object as a constructor.
		@param ctx The execution context to use.
		@param object The JSObject to call as a constructor.
		@param argumentCount An integer count of the number of arguments in arguments.
		@param arguments A JSValue array of arguments to pass to the constructor. Pass NULL if argumentCount is 0.
		@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
		@result The JSObject that results from calling object as a constructor, or NULL if an exception is thrown or object is not a constructor.
		*/
		
		[CLink]
		public static extern JSObjectRef JSObjectCallAsConstructor(JSContextRef ctx, JSObjectRef object, uint32 argumentCount, JSValueRef* arguments, JSValueRef* exception);
		
		/*!
		@function
		@abstract Gets the names of an object's enumerable properties.
		@param ctx The execution context to use.
		@param object The object whose property names you want to get.
		@result A JSPropertyNameArray containing the names object's enumerable properties. Ownership follows the Create Rule.
		*/
		
		[CLink]
		public static extern JSPropertyNameArrayRef JSObjectCopyPropertyNames(JSContextRef ctx, JSObjectRef object);
		
		/*!
		@function
		@abstract Retains a JavaScript property name array.
		@param array The JSPropertyNameArray to retain.
		@result A JSPropertyNameArray that is the same as array.
		*/
		
		[CLink]
		public static extern JSPropertyNameArrayRef JSPropertyNameArrayRetain(JSPropertyNameArrayRef array);
		
		/*!
		@function
		@abstract Releases a JavaScript property name array.
		@param array The JSPropetyNameArray to release.
		*/
		
		[CLink]
		public static extern void JSPropertyNameArrayRelease(JSPropertyNameArrayRef array);
		
		/*!
		@function
		@abstract Gets a count of the number of items in a JavaScript property name array.
		@param array The array from which to retrieve the count.
		@result An integer count of the number of names in array.
		*/
		
		[CLink]
		public static extern uint32 JSPropertyNameArrayGetCount(JSPropertyNameArrayRef array);
		
		/*!
		@function
		@abstract Gets a property name at a given index in a JavaScript property name array.
		@param array The array from which to retrieve the property name.
		@param index The index of the property name to retrieve.
		@result A JSStringRef containing the property name.
		*/
		
		[CLink]
		public static extern JSStringRef JSPropertyNameArrayGetNameAtIndex(JSPropertyNameArrayRef array, uint32 index);
		
		/*!
		@function
		@abstract Adds a property name to a JavaScript property name accumulator.
		@param accumulator The accumulator object to which to add the property name.
		@param propertyName The property name to add.
		*/
		
		[CLink]
		public static extern void JSPropertyNameAccumulatorAddName(JSPropertyNameAccumulatorRef accumulator, JSStringRef propertyName);
	}
}
