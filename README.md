# Video MetaData Access API

### Video Methods

#### POST api/videos

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

#### PUT api/videos/id

* Updates existing video entry.
* Command: `curl -X PUT --data "title=new+title&desc=new+description&actors=Tom+Cruise%2CJohn+Smith%2CAngelina+Jolie&directors=Steven+Spielberg" http://localhost:3000/videos/1`

**Returns:**
```json

```

#### DELETE api/videos/id

* Deletes existing video entry.
* Command: `curl -X DELETE http://localhost:3000/videos/1`

**Returns:**
```json

```

#### GET api/videos

* Returns list of video entries.
* Command: `curl -X GET http://localhost:3000/videos`

**Returns:**
```json

```




### Development Process:

Please find the schema design for the database [here](https://github.com/banud/video-access-api/blob/master/app/assets/images/database_schema.png)
[Database Schema Design](/app/assest/images/database_schema.png)
