---
order: -3
---

## What is the date/time format used in the response to the requests?

The response to the requests uses the **Roundtrip** format: 2008-04-10T06:30:00.0000000-07:00\
where *-07:00* is UTC offset which is set on the portal.

In case the portal uses UTC time without any offset, the date/time format in the response will be the following: 2008-04-10T06:30:00.0000000Z.

As for the request, only date can be send in it: 2008-04-10.

If you use the date/time in URL request, colons must be avoided and replaced by hyphens: 2008-04-10T06-30-00.000Z.

Please note that the UTC date and time without the offset are used in this case.

## How to get json or xml format?

You can get *json* or *xml* format adding *.json* or *.xml* to the request or pointing the request *Content-Type* in application/json or text/xml.

E.g.: api/2.0/people.json

## Is the response data pagination supported?

Yes. More information you can find in the [Request filtering](../Filtering/index.md) section.
