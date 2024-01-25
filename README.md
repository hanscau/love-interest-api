# Getting Started with LoveInterest API

Frontend can be found here: [LoveInterest React](https://github.com/hanscau/love-interest)

Written for 2024 CVWO submission

## Setup

Tested on WSL Ubuntu 22.04.3 (Jammy Jellyfish)

Adapted from

### Prerequisite

Ruby 3.0.2

Rails 7.1.3

### Dependency setup

[Install Rbenv](https://github.com/rbenv/rbenv#basic-git-checkout)

```
rbenv install 3.0.2
rbenv global 3.0.2
```

Install gems

```
sudo gem install bundler
sudo gem install rails 7.1.3
```

Setup project

```bash
gh repo clone hanscau/love-interest-api
cd love-interest-api
bundler install
```

Setup database

```bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

Create S3 bucket with public access and an IAM profile to generate a secret API key

Create a .env file and put S3 data in

```bash
# love-interest-api/.env

export ACCESS_KEY=<S3_ACCESS_KEY>
export SECRET_ACCESS_KEY=<S3_SECRET_ACCESS_KEY>
export S3_BUCKET=<S3_BUCKET_NAME>
```

Start backend

```bash
bin/rails server
```
