// PERMUTE_ARGS:
// REQUIRED_ARGS: -D -Ddtest_results/compilable -o-
// POST_SCRIPT: compilable/extra-files/ddoc10-postscript.sh

// 294

/// The foo
struct Foo(T) { }
/// ditto
struct Foo(T,U) { }

/** This basic case doesn't work very well. The template signature is
  * documented twice, but the function signature (argument names and return
  * type) is not documented at all. This comment is also repeated twice. */
int func1(T)(T x) {}



/** This comment is also repeated twice, and the second function signature is
  * not very well documented. */
int func2(T,U)(T x, U y) {}

/// ditto
int func2(T)(T x) {}



///
template func3(T,U) {
        /** This used to work adequately and documented both func3 templates
          * simultaneously. Now, it documents the first template twice and
          * no longer documents the function argument and return types.*/
        int func3(T x, U y) {}
}

/// ditto
deprecated template func3(T, U=int, V:long) {
	private int func3(T x) {}
}



/**
 * blah
 */

void map(char rs)
{
}

/// Ditto
void map(int rs)
{
}



/**
 * blah
 */

void map2()(char rs)
{
}

/// Ditto
void map2()(int rs)
{
}



/**
 * blah http://www.map3.com map3
 */

void map3(char rs)
{
}




/**
 * blah http://www.map.com map
 */

void map4(string s)(char rs)
{
}



/**
 * blah http://www.map.com map
 */

template map5(string s)
{
}


/** blah */
struct bar6 {
        int blah;
}


/** template bodies */
struct Foo7(T) {

    /**Attempt one:  Doc outside static if.*/
    static if(is(T == uint)) {
        /**Attempt two:  Inside.*/
        void bar() {}
    }
    else {
        /**Attempt two:  else.*/
        void bar() {}
    }

    /** the abc function should be static */
    static void abc() { }
}


/** show abstract */
abstract class Foo8 { }

/// a stray $(RPAREN) mustn't foul the macros
void bug4878(string a = ")") {}

/****
 */
struct S
{
    /****
     */
    this(long ticks) const pure nothrow { }

    /****
     */
    const pure nothrow this(this) { }

    /****
     */
    const pure nothrow ~this() { }

    /****
     */
    void foo(long ticks) const pure nothrow { }
}


/** Produces something in (a;b] */
float f10(float a, float b) { return (a+b)/2.0; }
/** Produces something in [a;b) */
float h10(float a, float b) { return (a+b)/2.0; }


///
void bug6090(string f="$(B b)", char g=')')(string h="$(", string i="$)") {}
