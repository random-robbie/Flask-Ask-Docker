# Flask-Ask-Docker

![Alexa Logo](https://cdn3.techadvisor.co.uk/cmsdata/features/3660854/how-to-use-alexa_thumb800.jpg)

Flask-Ask Docker container with sample app that will automatically connect ngrok for use as an alexa skill

This uses spacegeek as an example alexa skill app.

You can change the sample app for your Alexa Skill and then deploy it with docker and have ngrok automatically create the https endpoint.

Sample app listens on port 5000 and ngrok listens on port 4040.

Nrok has the web interface enabled so you can get the endpoint it's connecting to and see all traffic.

Ensure you firewall off that!


Build and Run:
----
```
docker build -t spacegeek .
```

```
docker run -d -p 5000:5000 -p 4040 spacegeek:latest
```

Reminder
----

Remember to change the Dockerfile copy and entrypoint when making your own app.




