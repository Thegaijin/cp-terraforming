# cp-terraforming

CP-deployment Terraform scripts

Make sure you have awscli installed, incase you don't run

`pip install awscli`

After installing the cli, run

`aws configure`

This will prompt you to enter your aws_access_key and the aws_secret_key. The reason we do this is to avoid setting our credentials in the configurations in effect keeping our credentials safe.

Make sure you have terraform installed as well. To install Terraform you can follow these [instructions](https://www.terraform.io/intro/getting-started/install.html).

If you have brew on your machine, run.

`brew terraform`

Once terraform is installed, clone the repo.
Ensure that you have created the necessary images required to create the instances in these configurations. Head over to this [repository](https://github.com/Thegaijin/cp4-aws) to do so.

Once you have done that, enter this repository's directory and run

`terraform init`

This command initialises the configurations in the directory.

To run the scripts do.

`terraform apply`
