/*
BASIC API DOCUMENTATION (for full API see http://docs.jquery.com/Qunit#API_documentation )

Setup:
	test( name, [expected], test )
		Add a test to run.

	expect( amount )
		Specify how many assertions are expected to run within a test.

	module( name, [lifecycle] )
		Separate tests into modules.

Assertions:
	ok( state, [message] )
		A boolean assertion, equivalent to JUnit's assertTrue. Passes if the first argument is truthy.

	equal( actual, expected, [message] )
		A comparison assertion, equivalent to JUnit's assertEquals.

	notEqual( actual, expected, [message] )
		A comparison assertion, equivalent to JUnit's assertNotEquals.

	deepEqual( actual, expected, [message] )
		A deep recursive comparison assertion, working on primitive types, arrays and objects.

	notDeepEqual( actual, expected, [message] )
		A deep recursive comparison assertion, working on primitive types, arrays and objects, with the result inverted, passing when some property isn't equal.

	strictEqual( actual, expected, [message] )
		A stricter comparison assertion then equal.

	notStrictEqual( actual, expected, [message] )
		A stricter comparison assertion then notEqual.

	raises( state, [message] )
		Assertion to test if a callback throws an exception when run.
*/

// Basic Example

// These test are not included in a module
test("This is the name for this test", function() { // does not use the "expected" param
	expect(1);	// register how many assertions to Expect to be run within this test.
	ok(true);	// No message, so will just display 'okay'
})

// is the same as
test("This is another test", 1, function() { // use the "expected" param to register how many
										   // assertions to Expect to be run within this test.
	ok(true, 'Look, a message!');
})

//Declare a module to group tests together in
module('My Module');

// The following tests will be part of a module called 'My Module'
test("1-2-3", function() {
	expect(3);
	var one = 1, two = 2, three = 3;

	equals(one, 1, "1 equals 1");
	equals(two, 2, "2 equals 2");
	equals(three, 3, "3 equals 3");
});

test("4-5-6", function() {
	expect(3);
	var four = 4, five = 5, six = 6;

	equals(four, 4, "4 equals 4");
	equals(five, 5, "5 equals 5");
	equals(six, 6, "6 equals 6");
});


module('All these tests will fail...');
test("This test will fail", 2, function() {
	ok(false); // setting this to false will cause the test to fail
	equals(1,2, 'Of course 1 does not equal 2!');
})

test("This test will also fail", 1, function() {
	// Will yield: "Expected 1 assertions, but 0 were run""
})
