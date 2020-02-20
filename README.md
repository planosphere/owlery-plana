[![Build Status](https://travis-ci.org/VirtualFlyBrain/owlery-vfb.svg?branch=master)](https://travis-ci.org/VirtualFlyBrain/owlery-vfb)[![Docker Hub](https://www.shippable.com/assets/images/logos/docker-hub.jpg)](https://hub.docker.com/r/virtualflybrain/owlery-vfb/)

# owlery-plana
Owlery server loaded with plana.owl  

Forked from [owlery-vfb](https://github.com/VirtualFlyBrain/owlery-vfb). Check it out. They have a registered docker image to use. owlery-plana does not. 

The owlery-vfb was forked and every instance of vfb.owl url was replaced with plana.owl url. 'vfb' was replaced with 'plana'


## Notes
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

__isa__

get children of organ PLANA_0000431

**direct=true only returns immediate isa children**

```
http://localhost:8080/kbs/plana/subclasses?object=obo:PLANA_0000431&prefixes={%22obo%22:%22http://purl.obolibrary.org/obo/%22}&direct=true
```
returns:
```
{
	"@id": "http://purl.obolibrary.org/obo/PLANA_0000431",
	"superClassOf": [
		"http://purl.obolibrary.org/obo/PLANA_0000240",
		"http://purl.obolibrary.org/obo/PLANA_0002089",
		"http://purl.obolibrary.org/obo/PLANA_0000072",
		"http://purl.obolibrary.org/obo/PLANA_0000016",
		"http://purl.obolibrary.org/obo/PLANA_0000079",
		"http://purl.obolibrary.org/obo/PLANA_0000034",
		"http://purl.obolibrary.org/obo/PLANA_0000097",
		"http://purl.obolibrary.org/obo/PLANA_0000026",
		"http://purl.obolibrary.org/obo/PLANA_0000020",
		"http://purl.obolibrary.org/obo/PLANA_0000036",
		"http://purl.obolibrary.org/obo/PLANA_0002120",
		"http://purl.obolibrary.org/obo/PLANA_0000013",
		"http://purl.obolibrary.org/obo/PLANA_0002007",
		"http://purl.obolibrary.org/obo/PLANA_0000044"
	],
	"@context": "https://owlery.phenoscape.org/json/context.jsonld"
}
```


**leave out direct=true to return all transitive isa children**

```
http://localhost:8080/kbs/plana/subclasses?object=obo:PLANA_0000431&prefixes={%22obo%22:%22http://purl.obolibrary.org/obo/%22}
```
returns:

```
{
	"@id": "http://purl.obolibrary.org/obo/PLANA_0000431",
	"superClassOf": [
		"http://purl.obolibrary.org/obo/PLANA_0000207",
		"http://purl.obolibrary.org/obo/PLANA_0002087",
		"http://purl.obolibrary.org/obo/PLANA_0000208",
		"http://purl.obolibrary.org/obo/PLANA_0000217",
		"http://purl.obolibrary.org/obo/PLANA_0002089",
		"http://purl.obolibrary.org/obo/PLANA_0000079",
		"http://purl.obolibrary.org/obo/PLANA_0000204",
		"http://purl.obolibrary.org/obo/PLANA_0000205",
		"http://purl.obolibrary.org/obo/PLANA_0000034",
		"http://purl.obolibrary.org/obo/PLANA_0000026",
		"http://purl.obolibrary.org/obo/PLANA_0000036",
		"http://purl.obolibrary.org/obo/PLANA_0002031",
		"http://purl.obolibrary.org/obo/PLANA_0000029",
		"http://purl.obolibrary.org/obo/PLANA_0000240",
		"http://purl.obolibrary.org/obo/PLANA_0002063",
		"http://purl.obolibrary.org/obo/PLANA_0000023",
		"http://purl.obolibrary.org/obo/PLANA_0000233",
		"http://purl.obolibrary.org/obo/PLANA_0000234",
		"http://purl.obolibrary.org/obo/PLANA_0000072",
		"http://purl.obolibrary.org/obo/PLANA_0000016",
		"http://purl.obolibrary.org/obo/PLANA_0000097",
		"http://purl.obolibrary.org/obo/PLANA_0000020",
		"http://purl.obolibrary.org/obo/PLANA_0000230",
		"http://purl.obolibrary.org/obo/PLANA_0002120",
		"http://purl.obolibrary.org/obo/PLANA_0002007",
		"http://purl.obolibrary.org/obo/PLANA_0000013",
		"http://purl.obolibrary.org/obo/PLANA_0000206",
		"http://purl.obolibrary.org/obo/PLANA_0000061",
		"http://purl.obolibrary.org/obo/PLANA_0000044"
	],
	"@context": "https://owlery.phenoscape.org/json/context.jsonld"
}
```
