# Video MetaData Access API

An API to access Video Metadata Information.

### Video Methods
Output format is JSON.

##### POST api/videos

* Adds new video entry.
* Command: `curl -X POST --data "title=title&desc=description&actors=Tom+Cruise%2CJohn+Smith%2CAngelina+Jolie&directors=Steven+Spielberg" http://localhost:3000/videos`

**Returns:**
```json
{
    "video": {
        "title": "title",
        "desc": "description",
        "actors": [
            "Tom Cruise",
            "John Smith",
            "Angelina Jolie"
        ],
        "directors": [
            "Steven Spielberg"
        ]
    },
    "success": true
}
```

##### PUT api/videos/id

* Updates existing video entry.
* Command: `curl -X PUT --data "title=new+title&desc=new+description&actors=Tom+Cruise%2CJohn+Smith%2CAngelina+Jolie&directors=Steven+Spielberg" http://localhost:3000/videos/1`

**Returns:**
```json
{
    "video": {
        "title": "new title",
        "desc": "new description",
        "actors": [
            "Tom Cruise",
            "John Smith",
            "Angelina Jolie"
        ],
        "directors": [
            "Steven Spielberg"
        ]
    },
    "success": true
}
```

##### DELETE api/videos/id

* Deletes existing video entry and returns deleted video metadata.
* Command: `curl -X DELETE http://localhost:3000/videos/1`

**Returns:**
```json
{
    "video": {
        "title": "new title",
        "desc": "new description",
        "actors": [
            "Tom Cruise",
            "John Smith",
            "Angelina Jolie"
        ],
        "directors": [
            "Steven Spielberg"
        ]
    },
    "success": true
}
```

##### GET api/videos

* Returns list of video entries.
* Command: `curl -X GET http://localhost:3000/videos`

**Returns:**
```json
{
    "videos": [
        {
            "title": "new title",
            "desc": "new description",
            "actors": [
                "Tom Cruise",
                "John Smith",
                "Angelina Jolie"
            ],
            "directors": [
                "Steven Spielberg"
            ]
        },
        {
            "title": "two",
            "desc": "something",
            "actors": [
                "Danny DeVito",
                "Arnold Schwarzenegger"
            ],
            "directors": [
                "Danny DeVito"
            ]
        }
    ],
    "success": true
}
```

#### Error Handling
###### Missing Field
**Missing title:**
**Returns:**
```json
{
    "success": false,
    "errors": "Missing title field"
}
```

**Missing description:**
**Returns:**
```json
{
    "success": false,
    "errors": "Missing description field"
}
```
**Missing both title and description:**
**Returns:**
```json
{
    "success": false,
    "errors": "Missing title field, Missing description field"
}
```


###### Updating or deleting with invalid video ID
**Returns:**
```json
{
    "success": false,
    "error": "Invalid video ID"
}
```


## Development Process:

Please find the schema design for the database [here](https://github.com/banud/video-access-api/blob/master/app/assets/images/database_schema.png)
[Database Schema Design](images/database_schema.png)
