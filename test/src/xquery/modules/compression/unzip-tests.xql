xquery version "3.0";

module namespace uz="http://exist-db.org/testsuite/unzips";

import module namespace test="http://exist-db.org/xquery/xqsuite" at "resource:org/exist/xquery/lib/xqsuite/xqsuite.xql";

import module namespace compression="http://exist-db.org/xquery/compression";


declare variable $uz:collection-name := "unzip-test";
declare variable $uz:collection := "/db/" || $uz:collection-name;

declare variable $uz:myFile-name := "myFile.xml";
declare variable $uz:myFile-serialized := "<file/>";

declare variable $uz:myZipEntries := (<entry name="{$uz:myFile-name}" type="uri">{$uz:collection}/{$uz:myFile-name}</entry>);
declare variable $uz:myZipContentBase64 := compression:zip($uz:myZipEntries, true(), $uz:collection);
declare variable $uz:myStaticContentBase64 := xs:base64Binary("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");

declare
    %test:setUp
function uz:setup() {
    let $coll := xmldb:create-collection("/db", $uz:collection-name)
    return (
        sm:chmod(xs:anyURI($coll), "rwxrwxrwx"),
        xmldb:store($uz:collection, $uz:myFile-name, util:parse($uz:myFile-serialized))
    )
};

declare
    %test:tearDown
function uz:cleanup() {
    xmldb:remove($uz:collection)
};

declare
    %test:user("guest", "guest")
    %test:args("myFile.xml")
    %test:assertTrue
function uz:fnDocAvailable($myFile-name as xs:string) {
    doc-available($uz:collection || "/" || $myFile-name)
};

declare
    %test:user("guest", "guest")
	%test:args("myFile.xml")
	%test:assertEquals("<file/>")
function uz:fnContentAvailable($myFile-name as xs:string) {
    doc($uz:collection || "/" || $myFile-name)
};
