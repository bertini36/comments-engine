[![Build Status](https://travis-ci.org/bertini36/serverless-comments-engine.svg?branch=master)](https://travis-ci.org/bertini36/serverless-comments-engine)
[![Requirements Status](https://requires.io/github/bertini36/serverless-comments-engine/requirements.svg?branch=master)](https://requires.io/github/bertini36/serverless-comments-engine/requirements/?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/bertini36/serverless-comments-engine/badge.svg?branch=master)](https://coveralls.io/github/bertini36/serverless-comments-engine?branch=master)
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<h3 align="center">
    bertini36/serverless-comments-engine 💬
</h3>
<p align="center">
  <a href="#-environment-setup" target="_blank">
    Installation
  </a>&nbsp;&nbsp;•&nbsp;
  <a href="https://github.com/bertini36/serverless-comments-engine/blob/master/serverless.yml" target="_blank">
    Serverless config
  </a>&nbsp;&nbsp;•&nbsp;
  <a href="https://github.com/bertini36/serverless-comments-engine/blob/master/Makefile" target="_blank">
    Commands
  </a>
</p>
<p align="center">
A simple Flasky app to save comments about topics deployed without cost using
<a href="https://www.serverless.com/" target="_blank">Serverless</a> framework and
<a href="https://aws.amazon.com/" target="_blank">AWS</a>
</p>
<p align="center">
Powered by <a href="https://www.serverless.com/" target="_blank">#serverless</a>,
<a href="https://aws.amazon.com/" target="_blank">#aws</a> and
 <a href="https://flask.palletsprojects.com/en/1.1.x/" target="_blank">#flask</a>
</p>

## ⚙️ Environment Setup

### 🐳 Required tools

1. [Install Docker and Docker Compose](https://www.docker.com/get-started)
2. Clone this project: `git clone https://github.com/bertini36/serverless-comments-engine`
3. Move to the project folder: `serverless-comments-engine`

### 🔥 Application execution

1. Install all the dependencies and bring up the project with Docker executing: `make build`
2. Run the server: `make up` (by default Flask runs applications at 5000 port)

### 👩‍💻 API endpoints
* Get comments
```python
import requests

response = requests.get('http://127.0.0.1:5000/comments/topic')
```
* Register comment
```python
import json
import requests

response = requests.post(
    'http://127.0.0.1:5000/comments/topic',
    json.dumps({'name': 'John Doe', 'email': 'john@doe.com', 'text': 'Ouh mama'}),
    headers={'Content-Type': 'application/json'}
)
```


## 🚀 Deploy

First set your AWS credentials and optionally, you can add a
 [Sentry](https://sentry.io/) DSN in `.env` file.
```bash
cp .env-sample .env
```

Ensure that your AWS user group has the required roles:
* `AWSLambdaFullAccess`
* `IAMFullAccess`
* `CloudWatchFullAccess`
* `AmazonDynamoDBFullAccess`
* `AmazonAPIGatewayAdministrator`
* `AWSCloudFormationFullAccess`

After this, to deploy your lambda functions
```bash
make deploy
```
When deploy is finished you will see the app endpoints for get and add comments.

<br />
<p align="center">&mdash; Built with :heart: from Mallorca &mdash;</p>
