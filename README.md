# README

## Summary
This is a small service which generates a shortened url against any url.

## Demonstration

Following is a demo page you can overview functions

https://url-shortner-px.herokuapp.com/

## Redirection API
### Summary
This api lead users to the registered URL

### Endpoint

```
GET /r/${identifier}
```

### Request params

| param | required | type | description | sample value |
| --- | --- | --- | --- | --- |
| identifier | required | String | Specify identifier issued by console | 9R97oe |

### Response params
The one who access this endpoint will be redirected the original URL with `301`


## Statistics API
### Summary
This api provides a stats and list of logs with given id.
### Endpoint

```
GET /stats/${identifier}
```

### Request params

| param | required | type | description | sample value |
| --- | --- | --- | --- | --- |
| identifier | required | String | Specify identifier issued by console | 9R97oe |


### Response params

api returns a list of hotels avaliable against condition. Each hotel has following parameters

| param | type | description | sample value |
| --- | --- | --- | --- |
| count | Int | Num of logs in total | 3 |
| logs | Array | Contains a list of access logs to the given identifier | [] |

Each logs comes with following parameters 

| param | type | description | sample value |
| --- | --- | --- | --- |
| id | String | uuid of a log | ef13cea0-b543-45c2-b533-d6900c261112 |
| ip | String | ip address of a user who accessed | 123.45.67 |
|user_agent| String | User Agent of the request | curl/34.0 |
|access_at| String | Time of each logs | 2017-07-31T19:05:40.000Z |


### Note

