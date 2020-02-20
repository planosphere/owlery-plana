[![Build Status](https://travis-ci.org/VirtualFlyBrain/owlery-vfb.svg?branch=master)](https://travis-ci.org/VirtualFlyBrain/owlery-vfb)[![Docker Hub](https://www.shippable.com/assets/images/logos/docker-hub.jpg)](https://hub.docker.com/r/virtualflybrain/owlery-vfb/)

# owlery-vfb
Owlery server loaded with VFB.owl  

```
docker run -p 80:8080 virtualflybrain/owlery-vfb
```

Note: env OWLURL overrides the called url
```
docker run -p 80:8080 --env=OWLURL=http://site.com/vfb.owl[.gz] virtualflybrain/owlery-vfb
```

## For PLANA 
by sofia 02-19-2020

__Build & Run__

Since I don't have an image available through docker site, You need to build an image
```
docker image build -t owlery-plana:1.0 .
```

Now run your image:
```
docker container run --publish 8080:8080 --name op owlery-plana:1.0
```

go to browser and run this:
```
http://localhost:8080/kbs/plana
```


__Query for all terms that are part of the eye (PLANA_0000036)__
```
http://localhost:8080/kbs/plana/subclasses?object=part_of: some obo:PLANA_0000036&prefixes={"obo": "http://purl.obolibrary.org/obo/", "part_of": "http://purl.obolibrary.org/obo/BFO_0000050"}&direct=true
```
This returns:
```
{
	"@id": "_:b0",
	"value": "ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/PLANA_0000036>)",
	"superClassOf": [
		"http://purl.obolibrary.org/obo/PLANA_0002091",
		"http://purl.obolibrary.org/obo/PLANA_0000031",
		"http://purl.obolibrary.org/obo/PLANA_0003103",
		"http://purl.obolibrary.org/obo/PLANA_0002092",
		"http://purl.obolibrary.org/obo/PLANA_0000075",
		"http://purl.obolibrary.org/obo/PLANA_0002058",
		"http://purl.obolibrary.org/obo/PLANA_0003114",
		"http://purl.obolibrary.org/obo/PLANA_0000017",
		"http://purl.obolibrary.org/obo/PLANA_0002035"
	],
	"@context": "https://owlery.phenoscape.org/json/context.jsonld"
}
```


## building and pushing to docker hub

build an image with the name srobb1/owlery-plana
```
docker build --tag srobb1/owlery-plana .
```

push it to docker hub

```
 docker push srobb1/owlery-plan
```

now run it by referencing it from docker hub

```
docker run -p 8080:8080 srobb1/owlery-plana
```


## stop the image

```
docker ps
```

find the container id

```
docker ps
CONTAINER ID        IMAGE                 COMMAND             CREATED              STATUS              PORTS                    NAMES
fa4c96eac049        srobb1/owlery-plana   "/startup.sh"       About a minute ago   Up About a minute   0.0.0.0:8080->8080/tcp   competent_tu
```

stop the container

```
docker stop fa4c96eac049
```

