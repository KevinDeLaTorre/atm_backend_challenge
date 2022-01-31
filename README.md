# ATM Backend Challenge
**Description Given**

We want you to build a REST API (Ruby on Rails preferred). It will allow users to submit IP addresses. You will fetch the country/city from GeoJS and store them in server memory cache. A second end point should allow users to see all IP addresses tracked, and the data associated with it. The user should also be able to filter all IP addresses by country/city.

The IP addresses and their data don't need to be persisted to a database. Also the API should return JSON.


**Setup**

```bundle install```

```rails db:migrate```

```rails start```

**API Calls**
| Method | Path | Params | Description |
| --- | --- | --- | --- |
| GET | /ips | - | Returns a json of all ip addresses being tracked. |
| GET | /ips | :country / :city | Filters index page and returns a json that includes either country/city or both if given. |
| POST | /ips | :ip | Returns json of city/location of ip and saves to db. |
